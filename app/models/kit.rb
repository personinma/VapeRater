class Kit < Product
	has_one :details, class_name: 'KitDet', dependent: :delete
	delegate_details :battery, :button, :cartridge, :charger, :mouthpiece, :tank, :wick, to: :details
	default_scope {joins(:details)}
end
