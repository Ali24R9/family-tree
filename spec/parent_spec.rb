require 'spec_helper'

describe Parent do
  it { should have_and_belong_to_many :children}
end

