class Document < ApplicationRecord
  mount_uploader :attach, AttachUploader
end
