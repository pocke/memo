require_relative '../rails_helper'

describe BoardsController do
  login_user

  describe '#index' do
    before{get :index}

    should_be_success
  end

  describe '#create' do
    let(:name){'BOARD_NAME'}
    before{post :create, name: name}
    should_be_success

    it 'should assign @board' do
      expect(assigns[:board]).to be_a Board
      expect(assigns[:board].name).to eq name
    end
  end

  describe '#show' do
    let(:board){create(:board)}

    let(:req){get :show, id: board.id}
    before do
      create(:memo, board: board)
    end
    before{req}

    it 'should assign @board' do
      expect(assigns[:board]).to eq board
    end

    it 'should assign @memos' do
      expect(assigns[:memos]).to eq board.memos
    end
  end
end
