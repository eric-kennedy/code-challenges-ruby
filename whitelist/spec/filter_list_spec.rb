# frozen_string_literal: true

require 'rspec'
require_relative '../filter_list'

describe 'filter_list' do
  it 'filters out items that are not in the whitelist' do
    items = [1, 2, 3]
    whitelist = [1, 3]
    answer = [1, 3]
    expect(filter_list(items, whitelist)).to eq(answer)
  end

  it 'ignores extra whitelist entries' do
    items = [1, 2, 3]
    whitelist = [1, 4, 5, 3, 6]
    answer = [1, 3]
    expect(filter_list(items, whitelist)).to eq(answer)
  end

  it 'preserves original list order' do
    items = [3, 2, 1]
    whitelist = [1, 3]
    answer = [3, 1]
    expect(filter_list(items, whitelist)).to eq(answer)
  end

  it 'preserves duplicate list items' do
    items = [3, 3, 2, 2, 1, 1]
    whitelist = [1, 3]
    answer = [3, 3, 1, 1]
    expect(filter_list(items, whitelist)).to eq(answer)
  end

  it 'preserves order of duplicate items' do
    items = [1, 2, 3, 2, 3, 1]
    whitelist = [1, 3]
    answer = [1, 3, 3, 1]
    expect(filter_list(items, whitelist)).to eq(answer)
  end

  it 'ignores duplicate whitelist entries' do
    items = [1, 2, 3]
    whitelist = [1, 1, 3, 3]
    answer = [1, 3]
    expect(filter_list(items, whitelist)).to eq(answer)
  end
end
