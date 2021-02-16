require "First_TDD_Projects.rb"
require "rspec"

#my_uniq, should remove duplicate elements from an array and return a NEW array


describe "#my_uniq" do 
    arr = [1, 2, 4, 4, 2, 7, 8, 9, 9]

    it "should take in Array and return a new Array" do
        expect(arr.my_uniq).to be_an_instance_of(Array)
        expect(arr.my_uniq).not_to be(arr)
    end
    it "should remove duplicates" do 
        expect(arr.my_uniq).to eql(arr.uniq)
    end
end

describe "#two_sum" do 
  arr = [-1,0,2,-2,1,-1]
  it 'should take in an array and return a 2D array' do
    expect(arr.two_sum).to be_an_instance_of(Array)
    expect(arr.two_sum.first).to be_an_instance_of(Array)
  end
  it 'should return an empty array if there are no pairs' do 
    arr_2 = [1,2,3]
    expect(arr_2.two_sum).to be_empty
  end
  it 'should be sorted from smallest to largest' do 
    expect(arr.two_sum).to eq(arr.two_sum.sort)
  end
end

describe '#my_transpose' do
  rows = [[0,1,2],[3,4,5],[6,7,8]]
  cols = [[0,3,6],[1,4,7],[2,5,8]]

  it 'should return an array' do
    expect(rows.my_transpose).to be_an_instance_of(Array)
  end

  it 'should flip x and y indices of the square matrix' do
    
    expect(rows.my_transpose).to eq(cols)
    expect(cols.my_transpose).to eq(rows)
  end
  
end

describe '#stock_picker' do
  stock_prices = [1, 3, 7, 2, 4, 3, 9]

  it 'should return an array containing two integers' do
    expect(stock_prices.stock_picker).to be_an_instance_of(Array)
    expect(stock_prices.stock_picker.length).to be (2)
    expect(stock_prices.stock_picker.all? {|ele| ele.is_a?(Integer)}).to be true
  end

  it "should return the indices of the pair of days that results in the highest positive difference" do
    expect(stock_prices.stock_picker).to eq([0, 6])
  end

end

describe '#initialize' do 
  board = [[1,2,3,4,5,6,7,8],[],[]]
  it 'should start with a single stack that is sorted' do 
    expect(board.one?{|ele| !ele.empty?}).to be true
  end
end

describe '#move' do 
  board = [[1,2,3,4,5,6,7,8],[],[]]
  pole1 = board[0]
  pole2 = board[1]
  pole3 = board[2]
  it 'each array must always be sorted' do 
    expect(pole1).to eq(pole1.sort)
    expect(pole2).to eq(pole2.sort)
    expect(pole3).to eq(pole3.sort)
  end
end

describe '#won?' do
  board = [[1,2,3,4,5,6,7,8],[],[]]
  board.shuffle
  pole1 = board[0]
  pole2 = board[1]
  pole3 = board[2]
  board.each_with_index do |pole,i|
    if !pole.empty?
      starting_pole = board[i]
    end
  end
  it 'game should finish on a pole that we did not start on' do
    expect(starting_pole.empty?).to be true
  end

  it 'ending pole should be sorted' do   
    expect(pole1).to eq(pole1.sort)
    expect(pole2).to eq(pole2.sort)
    expect(pole3).to eq(pole3.sort)
  end

  board.each do |pole|
    if pole != starting_pole && pole.length == starting_pole.length
      ending_pole = pole
    end
  end

  it 'ending pole should be full' do 
    expect(ending_pole.length).to eq(starting_pole.length)
  end
end