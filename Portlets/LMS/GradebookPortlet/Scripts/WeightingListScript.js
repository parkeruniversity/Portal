function GradebookWeightingLocations()
{
    this.MainControl = ".gradebookPortlet .weightingListControl";
    this.WeightInput = ".gradebookPortlet .weightingListControl .itemWeightList input.weightEntry";
    this.FinalPercent = ".gradebookPortlet .weightingListControl .itemWeightList #FinalPercent";
    this.FinalPercentTotal = ".gradebookPortlet .weightingListControl .itemWeightList #FinalTotalPercent";
    this.FinalExtraCreditPercent = ".gradebookPortlet .weightingListControl .extraCreditList #FinalExtraPercent";
    this.FinalExtraCreditPercentTotal = ".gradebookPortlet .weightingListControl .extraCreditList #FinalTotalExtraPercent";
    this.WeightTotal = ".gradebookPortlet .weightingListControl .itemWeightList #WeightTotal";
    this.ExtraCreditInput = ".gradebookPortlet .weightingListControl .extraCreditList input.weightEntry";
    this.ExtraCreditTotal = ".gradebookPortlet .weightingListControl .extraCreditList #extraCreditTotal";
}

function GradebookWeightingCss()
{
    this.MissingWeight = "missingWeight";
    this.InvalidTotalWeight = "invalidTotalWeight";
}

var _gbkWeightingLocations = null;
var _gbkWeightingCss = null;
var _totalPercentage = null;

function InitializeWeightingList(weightingLocations, weightingCss, totalPercentage) {
    _gbkWeightingLocations = weightingLocations;
    _gbkWeightingCss = weightingCss;
    _totalPercentage = (totalPercentage != null) ? totalPercentage / 100.0 : null;

    //Wire up events.
    $(_gbkWeightingLocations.WeightInput).keyup(ShowEditingControls);
    $(_gbkWeightingLocations.WeightInput).keyup(CheckForMissingWeights);
    $(_gbkWeightingLocations.WeightInput).keyup(CalculatePercentWeight);
    $(_gbkWeightingLocations.WeightInput).keyup(CalculateTotalWeight);
    $(_gbkWeightingLocations.WeightInput).keyup(CalculateTotalPercentWeight);
    $(_gbkWeightingLocations.WeightInput).blur(FillEmptyInput);
    $(_gbkWeightingLocations.ExtraCreditInput).keyup(ShowEditingControls);
    $(_gbkWeightingLocations.ExtraCreditInput).keyup(CalculateExtraCreditTotal);
    $(_gbkWeightingLocations.ExtraCreditInput).keyup(CalculateExtraCreditPercentWeight);
    $(_gbkWeightingLocations.ExtraCreditInput).keyup(CalculateExtraCreditTotalPercentWeight);

    //Initialize page display.
    CheckForMissingWeights();
    CalculateTotalWeight();
    $(_gbkWeightingLocations.WeightInput).each(CalculatePercentWeight);
    CalculateTotalPercentWeight();
    CalculateExtraCreditTotal();
    $(_gbkWeightingLocations.ExtraCreditInput).each(CalculateExtraCreditPercentWeight);
    CalculateExtraCreditTotalPercentWeight();
}

function ShowEditingControls() {
    $(_gbkWeightingLocations.MainControl).removeClass("initialView");
}

function CheckForMissingWeights(){
    var areAnyWeightsMissing = false;

    $(_gbkWeightingLocations.WeightInput).each(function () {
        if ($(this).val() == "") {
            $(this).parent().parent().addClass(_gbkWeightingCss.MissingWeight);
            areAnyWeightsMissing = true;
        }
        else {
            $(this).parent().parent().removeClass(_gbkWeightingCss.MissingWeight);
        }
    });

    if (areAnyWeightsMissing) {
        $(_gbkWeightingLocations.MainControl).addClass(_gbkWeightingCss.MissingWeight);
    }
    else {
        $(_gbkWeightingLocations.MainControl).removeClass(_gbkWeightingCss.MissingWeight);
    }
}

function CalculateTotalWeight() {
    var totalWeight = 0;
    $(_gbkWeightingLocations.WeightInput).each(function () {
        totalWeight += Number($(this).val());
    });
    totalWeight = roundTo(totalWeight, 2);

    var totalWeightText = (totalWeight > 0) ? totalWeight + "%" : "";
    var isTotalWeightValid = (totalWeight == 100);
    
    $(_gbkWeightingLocations.WeightTotal).text(totalWeightText);
    $(_gbkWeightingLocations.MainControl).toggleClass(_gbkWeightingCss.InvalidTotalWeight, !isTotalWeightValid);
}

function CalculatePercentWeight() {
    if (_totalPercentage == null) return;

    var idx = $(_gbkWeightingLocations.WeightInput).index(this);
    var weight = Number($(this).val());

    $(_gbkWeightingLocations.FinalPercent + idx).text(roundTo(weight * _totalPercentage, 2) + '%');
}

function CalculateTotalPercentWeight() {
    if (_totalPercentage == null) return;

    var total = 0;
    $(_gbkWeightingLocations.WeightInput).each(function () {
        total += Number($(this).val()) * _totalPercentage;
    });

    var roundedTotal = roundTo(total, 2);
    $(_gbkWeightingLocations.FinalPercentTotal).text(roundedTotal > 0 ? roundedTotal + '%' : '');
}

function CalculateExtraCreditTotal() {
    var totalWeight = 0;
    $(_gbkWeightingLocations.ExtraCreditInput).each(function () {
        totalWeight += Number($(this).val());
    });
    $(_gbkWeightingLocations.ExtraCreditTotal).text((totalWeight > 0) ? "+" + roundTo(totalWeight, 2) + "%" : "");
}

function CalculateExtraCreditPercentWeight() {
    if (_totalPercentage == null) return;

    var idx = $(_gbkWeightingLocations.ExtraCreditInput).index(this);
    var weight = Number($(this).val());

    $(_gbkWeightingLocations.FinalExtraCreditPercent + idx).text('+' + roundTo(weight * _totalPercentage, 2) + '%');
}

function CalculateExtraCreditTotalPercentWeight() {
    if (_totalPercentage == null) return;

    var total = 0;
    $(_gbkWeightingLocations.ExtraCreditInput).each(function () {
        total += Number($(this).val()) * _totalPercentage;
    });

    var roundedTotal = roundTo(total, 2);
    $(_gbkWeightingLocations.FinalExtraCreditPercentTotal).text(roundedTotal > 0 ? '+' + roundedTotal + '%' : '');
}

function FillEmptyInput() {
    if ($(this).val() == "") {
        ($(this)).val('0');

        CheckForMissingWeights();
        CalculateTotalWeight();
    }
}

function roundTo(valueToRound, decimalPlaces) {
    var multiplier = Math.pow(10, decimalPlaces);
    return Math.round(valueToRound * multiplier) / multiplier;
}
