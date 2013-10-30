require 'spec_helper'

module Blogr
  describe Image do
    it { should belong_to :post }
  end
end
