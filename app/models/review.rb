class Review < ApplicationRecord
  belongs_to :dogs,  optional: true
end
