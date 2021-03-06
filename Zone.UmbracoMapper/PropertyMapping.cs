﻿namespace Zone.UmbracoMapper
{
    using System;
    using System.Collections.Generic;

    /// <summary>
    /// Class defining the override to the mapping convention for a particular type.
    /// Will be passed in a Dictionary indicating the destination property on the view model, i.e.: Dictionary<string, PropertyMapping>
    /// </summary>
    public class PropertyMapping : IPropertyMapping
    {
        /// <summary>
        /// The name of the property on the source to map from.  If not passed, exact name match convention is used.
        /// </summary>
        public string SourceProperty { get; set; }

        /// <summary>
        /// Defines the number of levels above the current content to map the value from.  If not passed, 0 (the current
        /// level) is assumed.
        /// Only for IPublishedContent mappings.
        /// </summary>
        public int LevelsAbove { get; set; }

        /// <summary>
        /// If passed, the source property is assumed to be a structure that has related content (e.g. a Content Picker that
        /// contains an integer Id for another IPublishedContent).  The mapping is then done from the named property of 
        /// that child element.
        /// Only for IPublishedContent mappings.
        /// </summary>
        public string SourceRelatedProperty { get; set; }

        /// <summary>
        /// If passed, the source property is assumed to be a structure that has child content.  The mapping is then done 
        /// from the named field of that child element.
        /// Only for XML and JSON mappings.
        /// </summary>
        public string SourceChildProperty { get; set; }

        /// <summary>
        /// The names of the properties on the source to map from and concatenate.
        /// If not passed, exact name match convention or single match on SourceProperty is used.
        /// Only for IPublishedContent mappings.
        /// </summary>
        public string[] SourcePropertiesForConcatenation { get; set; }

        /// <summary>
        /// When SourcePropertiesForConcatenation is used, the separator string used to concatenate the items.
        /// If not passed, no separator is assumed.
        /// Only for IPublishedContent mappings.
        /// </summary>
        public string ConcatenationSeperator { get; set; }

        /// <summary>
        /// The names of the properties on the source to map from and coalesce (take the take the first non null, empty or whitespace property)
        /// If not passed, exact name match convention or single match on SourceProperty is used.
        /// Only for IPublishedContent mappings.
        /// </summary>
        public string[] SourcePropertiesForCoalescing { get; set; }

        /// <summary>
        /// If provided, mapping is only carried out if the property provided in the key contains the value provided in the value.
        /// </summary>
        public KeyValuePair<string, string> MapIfPropertyMatches { get; set; }

        /// <summary>
        /// If provided, carries out the formatting transformation provided in the function on the mapped value
        /// </summary>
        public Func<string, string> StringValueFormatter { get; set; }

        /// <summary>
        /// Sets a default value for a property to be used if the mapped value cannot be found.
        /// </summary>
        public object DefaultValue { get; set; }

        /// <summary>
        /// If set property will not be mapped even if an appropriate mapping could be found
        /// </summary>
        public bool Ignore { get; set; }

        /// <summary>
        /// If set property will be mapped from the given Umbraco dictionary key
        /// </summary>
        public string DictionaryKey { get; set; }

        /// <summary>
        /// Provides a type that must implement <see cref="IPropertyValueGetter"/> to be used when retrieving the property value from Umbraco.
        /// A use case for this is to use Vorto, where we want to call GetVortoValue instead of GetPropertyValue.
        /// </summary>
        public Type PropertyValueGetter { get; set; }
    }
}
