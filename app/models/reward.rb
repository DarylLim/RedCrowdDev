class Reward < Campaign
  default_scope { where(kind: Campaign::REWARD) } 
end
