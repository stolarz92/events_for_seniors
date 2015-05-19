(function (jQuery) {
    var self = null;
    var options = {};
    jQuery.fn.railsAutocomplete = function () {
        var handler = function () {
            if (!this.railsAutoCompleter) {
                this.railsAutoCompleter = new jQuery.railsAutocomplete(this)
            }
        };
        options[this.selector.replace("#", "")] = arguments[0];
        if (jQuery.fn.on !== undefined) {
            return $(document).on("focus", this.selector, handler)
        } else {
            return this.live("focus", handler)
        }
    };
    jQuery.railsAutocomplete = function (e) {
        _e = e;
        this.init(_e)
    };
    jQuery.railsAutocomplete.fn = jQuery.railsAutocomplete.prototype = {railsAutocomplete: "0.0.1"};
    jQuery.railsAutocomplete.fn.extend = jQuery.railsAutocomplete.extend = jQuery.extend;
    jQuery.railsAutocomplete.fn.extend({
        init: function (e) {
            e.delimiter = jQuery(e).attr("data-delimiter") || null;
            function split(val) {
                return val.split(e.delimiter)
            }

            function extractLast(term) {
                return split(term).pop().replace(/^\s+/, "")
            }

            jQuery(e).autocomplete($.extend({
                source: function (request, response) {
                    jQuery.getJSON(jQuery(e).attr("data-autocomplete"), {term: extractLast(request.term)}, function () {
                        if (arguments[0].length == 0) {
                            arguments[0] = [];
                            arguments[0][0] = {id: "", label: "no existing match"}
                        }
                        jQuery(arguments[0]).each(function (i, el) {
                            var obj = {};
                            obj[el.id] = el;
                            jQuery(e).data(obj)
                        });
                        response.apply(null, arguments)
                    })
                }, change: function (event, ui) {
                    if (jQuery(jQuery(this).attr("data-id-element")).val() == "") {
                        return
                    }
                    jQuery(jQuery(this).attr("data-id-element")).val(ui.item ? ui.item.id : "");
                    var update_elements = jQuery.parseJSON(jQuery(this).attr("data-update-elements"));
                    var data = ui.item ? jQuery(this).data(ui.item.id.toString()) : {};
                    if (update_elements && jQuery(update_elements.id).val() == "") {
                        return
                    }
                    for (var key in update_elements) {
                        jQuery(update_elements[key]).val(ui.item ? data[key] : "")
                    }
                }, search: function () {
                    var term = extractLast(this.value);
                    if (term.length < 2) {
                        return false
                    }
                }, focus: function () {
                    return false
                }, select: function (event, ui) {
                    var terms = split(this.value);
                    terms.pop();
                    terms.push(ui.item.value);
                    if (e.delimiter != null) {
                        terms.push("");
                        this.value = terms.join(e.delimiter)
                    } else {
                        this.value = terms.join("");
                        if (jQuery(this).attr("data-id-element")) {
                            jQuery(jQuery(this).attr("data-id-element")).val(ui.item.id)
                        }
                        if (jQuery(this).attr("data-update-elements")) {
                            var data = jQuery(this).data(ui.item.id.toString());
                            var update_elements = jQuery.parseJSON(jQuery(this).attr("data-update-elements"));
                            for (var key in update_elements) {
                                jQuery(update_elements[key]).val(data[key])
                            }
                        }
                    }
                    var remember_string = this.value;
                    jQuery(this).bind("keyup.clearId", function () {
                        if (jQuery(this).val().trim() != remember_string.trim()) {
                            jQuery(jQuery(this).attr("data-id-element")).val("");
                            jQuery(this).unbind("keyup.clearId")
                        }
                    });
                    jQuery(e).trigger("railsAutocomplete.select", ui);
                    return false
                }
            }, options[e.id]))
        }
    });
    jQuery(document).ready(function () {
        jQuery("input[data-autocomplete]").railsAutocomplete()
    })
})(jQuery);