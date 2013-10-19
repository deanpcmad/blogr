require 'spec_helper'

module Simpleblog
  describe Image do
    it { should belong_to :post }
  end
end
