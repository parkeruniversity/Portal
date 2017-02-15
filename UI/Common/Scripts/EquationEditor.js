function EquationEditor() {
    this.charLimit = 200;

    this.setImage = function() {
        $(this.eqImage).attr('src', this.format(this.url,
            encodeURIComponent($(this.eqText).val()), $(this.imgHeight).val()));
    };

    this.insertInTextArea = function(text) {
        if (text == "text_input") {
            var input = prompt("Enter text.", "");
            if (input == null || input == "") {
                alert("Text input cancelled.");
                return;
            }
            text = "\\mbox{" + input + "} ";
        }
        else if (text.indexOf("matrix") > -1) {
            var body = this.generateMatrixBody();
            if (body == null) {
                alert("Matrix creation cancelled.");
                return;
            }
            text = this.format(text, body);
        }
        else if (!this.endsWith(text, "\n")) {
            text += " ";
        }

        var eqtext = $(this.eqText).val();
        if (eqtext.length + text.length > this.charLimit) {
            alert("Adding that text would exceed the character limit.");
            return;
        }

        var index = text.indexOf("  ") + 1;
        var offset = 0;
        if (index > 0) offset = text.length - index;

        var txtarea = $(this.eqText)[0];
        var scrollPos = txtarea.scrollTop;

        if (this.cursorPosition) { //This feature is supported by some older versions of IE.
            txtarea.focus();
            this.cursorPosition.text = text;
            this.cursorPosition.moveStart("character", -offset);
            this.cursorPosition.moveEnd("character", -offset);
            this.cursorPosition.select();
        }
        else {
            var strPos = txtarea.selectionStart;

            var front = (txtarea.value).substring(0, strPos);
            var back = (txtarea.value).substring(strPos, txtarea.value.length);
            txtarea.value = front + text + back;
            strPos = strPos + text.length - offset;

            txtarea.selectionStart = strPos;
            txtarea.selectionEnd = strPos;
            txtarea.focus();
        }

        txtarea.scrollTop = scrollPos;

        this.update();
    };

    this.generateMatrixBody = function () {
        var cols = prompt("How many columns?", "");
        if (cols == null) return null;
        while (cols == "" || isNaN(cols)) {
            cols = prompt("How many columns? This must be a number.", "");
        }
        var rows = prompt("How many rows?", "");
        if (rows == null) return null;
        while (rows == "" || isNaN(rows)) {
            rows = prompt("How many columns? This must be a number.", "");
        }
        cols = parseInt(cols);
        rows = parseInt(rows);
        var body = "";
        var bodyrow = "\t{0} \\\\\n";
        var lastbodyrow = "\t{0}\n";
        var total = rows * cols;
        for (var x = 0; x < rows; x++) {
            var curr = "";
            for (var y = 1; y < cols + 1; y++) {
                if (y != 1) {
                    curr += "&";
                }
                var c = y + cols * x;
                if (total <= 26)
                    curr += String.fromCharCode(c + 96); // 96 is ascii offset to a
                else
                    curr += c;
            }
            if (x < rows + 1) {
                body += this.format(bodyrow, curr);
            }
            else {
                body += this.format(lastbodyrow, curr);
            }
        }
        return body;
    };

    this.checkTextAreaChars = function() {
        var text = $(this.eqText).val();
        var textlength = text.length;
        if (textlength >= this.charLimit) {
            $("#eqchars").html("Character limit reached");
            $(this.eqText).val(text.substr(0, this.charLimit));
            return false;
        }
        else {
            $("#eqchars").html(this.charLimit - textlength + " characters left");
            return true;
        }
    };

    this.toggleHelp = function() {
        $("#EqEditor").toggleClass("");
        $("#EqEditor").toggleClass("showHelp");

        var helpText = $("#EqEditor #helpText");
        helpText.text(helpText.text() == "Show help text" ? "Hide help text" : "Show help text");
    };

    this.update = function() {
        this.checkTextAreaChars();
        this.setImage();
    };

    this.format = function() {
        var s = arguments[0];
        for (var i = 0; i < arguments.length - 1; i++) {
            var reg = new RegExp("\\{" + i + "\\}", "gm");
            s = s.replace(reg, arguments[i + 1]);
        }

        return s;
    };

    this.endsWith = function(str, endstr) {
        return str.length >= endstr.length && str.substr(str.length - endstr.length) == endstr;
    };


    this.storeCursorPosition = function() {
        var txtArea = $(this.eqText)[0];
        if (!txtArea.createTextRange || !document.selection) return;

        this.cursorPosition = document.selection.createRange().duplicate();
    };

    this.initTextArea = function() {
        var txtArea = $(this.eqText)[0];
        txtArea.focus();
        this.storeCursorPosition();
    };

    this.initIconSetMenu = function(parentId, popupId) {
        $("#" + parentId).click(function() {
            $("#" + popupId).slideDown('fast').show(); //Drop down the content on click

            $(this).hover(function() { }, function() {
                $("#" + popupId).slideUp('fast'); //When the mouse hovers out of the content, move it back up
            });
        });
    };
}

$(document).ready(function () {
    ee.initTextArea();
    for (var i = 1; i <= 19; i++) {
        ee.initIconSetMenu("is" + i, "isp" + i);
    }
    if ($(ee.eqText).val() != "") {
        ee.update();
    };

    $(ee.eqText).keyup(function () {
        ee.update();
    });

    $("#EqEditor .header a").each(function () {
        this.href = "javascript:ee.insertInTextArea('" + this.id + "');";
    });

    $("#EqEditor #helpLink").each(function () {
        this.href = "javascript:ee.toggleHelp();";
    });

    $("#EqEditor select:not(" + ee.imgHeight + ")").change(function () {
        ee.insertInTextArea(this.value);
        this.options[0].selected = true;
    });

    $(ee.imgHeight).change(function () {
        ee.setImage();
    });

    $(ee.eqImage).error(function () {
        $(this).attr("src", "UI/Common/Images/spacer.gif");
    });
});