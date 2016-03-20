class Equity < Campaign
  default_scope { where(kind: Campaign::EQUITY) } 

end
