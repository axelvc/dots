;; Highlight html in storybook templates
(pair
    key: (property_identifier) @_key (#eq? @_key "template")
    value: (template_string) @html)
