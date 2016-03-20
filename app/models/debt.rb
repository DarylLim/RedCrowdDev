class Debt < Campaign
  default_scope { where(kind: Campaign::DEBT) } 

end
