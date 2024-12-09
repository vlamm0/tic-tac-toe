# frozen_string_literal: true

require 'rspec'
require_relative '../lib/main'
# require_relative '../lib/player'

# Test winning conditions
describe Game do
  subject(:test_game) { described_class.new }
  describe '#winner?' do
    context 'when row matches go to win screen' do
      before do
        allow(test_game).to receive(:check_row).and_return(true)
        allow(test_game).to receive(:check_col).and_return(false)
        allow(test_game).to receive(:check_cross).and_return(false)
      end
      it 'returns win screen' do
        expect(test_game.winner?).to be true
      end
    end
    context 'when column matches go to win screen' do
      before do
        allow(test_game).to receive(:check_row).and_return(false)
        allow(test_game).to receive(:check_col).and_return(true)
        allow(test_game).to receive(:check_cross).and_return(false)
      end
      it 'returns win screen' do
        expect(test_game.winner?).to be true
      end
    end
    context 'when diagonal match go to win screen' do
      before do
        allow(test_game).to receive(:check_row).and_return(false)
        allow(test_game).to receive(:check_col).and_return(false)
        allow(test_game).to receive(:check_cross).and_return(true)
      end
      it 'returns win screen' do
        expect(test_game.winner?).to be true
      end
    end
    context 'when no matches do not go to win screen' do
      before do
        allow(test_game).to receive(:check_row).and_return(false)
        allow(test_game).to receive(:check_col).and_return(false)
        allow(test_game).to receive(:check_cross).and_return(false)
      end
      it 'returns nothing' do
        expect(test_game.winner?).to be false
      end
    end
  end

  describe '#match?' do
    context 'when row matches' do
      let(:row1) { %w[X X X] }
      let(:row2) { %w[O O O] }
      it 'returns true' do
        expect(test_game.match?(row1)).to be true
        expect(test_game.match?(row2)).to be true
      end
    end
    context 'when NOT matching row' do
      let(:row1) { %w[O O X] }
      let(:row2) { %w[O X O] }
      let(:row3) { %w[X O O] }
      let(:row4) { %w[X X O] }
      let(:row5) { %w[X O X] }
      let(:row6) { %w[O X X] }
      let(:row7) { [1, 1, 1] }
      it 'returns false' do
        expect(test_game.match?(row1)).to be false
        expect(test_game.match?(row2)).to be false
        expect(test_game.match?(row3)).to be false
        expect(test_game.match?(row4)).to be false
        expect(test_game.match?(row5)).to be false
        expect(test_game.match?(row6)).to be false
        expect(test_game.match?(row7)).to be false
      end
    end
  end
  describe '#check_col' do
    context 'when col matches' do
      let(:data) { [['X', 1, 1], ['X', 1, 1], ['X', 1, 1]] }
      let(:col) { [[], [], []] }
      before do
        allow(test_game).to receive(:match?).and_return(true)
      end
      it 'returns true' do
        expect(test_game.check_col(data, col)).to be true
      end
    end
  end
  describe '#check_cross' do
    context 'when either diagonal matches' do
      before do
        allow(test_game).to receive(:match?).and_return(true, false)
      end
      it 'returns true' do
        expect(test_game.check_cross).to be true
      end
    end
    context 'when both diagonal false' do
      before do
        allow(test_game).to receive(:match?).and_return(false)
      end
      it 'returns false' do
        expect(test_game.check_cross).to be false
      end
    end
  end
  describe '#left_cross & #right_cross' do
    before do
      allow(test_game).to receive(:data).and_return([['O', 1, 1], [1, 'X', 1], [1, 1, 'X']])
    end
    it 'returns left diaganol' do
      expect(test_game.left_cross).to eq(%w[O X X])
      expect(test_game.right_cross).to eq([1, 'X', 1])
    end
  end

  describe '#update_board' do
    let(:icon) { 'X' }
    let(:square) { 1 }
    before do
      allow(test_game).to receive(:square_to_indexes).and_return([2, 1])
    end
    it 'updates board data correctly' do
      test_game.update_board(square, icon)
      sol = test_game.instance_variable_get(:@data)
      expect(sol).to eq([[1, 2, 3], [4, 5, 6], [7, 'X', 9]])
    end
  end

  describe '#square_to_index' do
    let(:square) { 7 }
    it 'returns correct 2d array element' do
      expect(test_game.square_to_indexes(square)).to eq([2, 0])
    end
  end

  describe '#curr_player' do
    let(:player1) { instance_double(Player, player: '1') }
    let(:player2) { instance_double(Player, player: '2') }
    context 'on odd turn' do
      it 'returns player 2' do
        test_game.instance_variable_set(:@turn, 7)
        test_game.instance_variable_set(:@players, [player1, player2])
        sol = test_game.curr_player.player
        expect(sol).to eq('2')
      end
    end
    context 'on even turn' do
      it 'returns player 1' do
        test_game.instance_variable_set(:@turn, 6)
        test_game.instance_variable_set(:@players, [player1, player2])
        sol = test_game.curr_player.player
        expect(sol).to eq('1')
      end
    end
  end
end
