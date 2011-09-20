Given /^#{capture_model}(?: as an? (\S+))? have #{capture_model}(?: with #{capture_fields})?$/ do |owner, association, owned, fields|
  owner = fetch_model!(owner)
  fields = fields.is_a?(Hash) ? parse_hash(fields) : parse_fields(fields)
  association ||= owner.class.name.downcase
  create_model(owned, fields.merge(association => owner))
end