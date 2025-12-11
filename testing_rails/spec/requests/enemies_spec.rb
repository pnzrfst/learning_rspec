require 'rails_helper'

RSpec.describe "Enemies", type: :request do
  describe "GET /enemies" do
    context "when user can get all enemies" do
      let!(:enemy) { create(:enemy) }
      before(:each) { get "/enemies" }

      it "returns the https status 200" do
        expect(response).to have_http_status(200)
      end

      it "returns the enemies list" do
        expected_list = [ enemy.as_json ]
        expect(json).to eq(expected_list)
      end
    end
  end

  describe "POST /enemies" do
    context "when user does provide valid parameters" do
        let(:enemy_data) { attributes_for(:enemy) }
        before(:each) { post "/enemies", params: { enemy: enemy_data } }
        it 'creates the enemy with correct attributes' do
          expect(Enemy.last).to have_attributes(enemy_data)
        end
    end

    context "when user does not provide valid parameters" do
      let(:invalid_attributes) { { enemy: attributes_for(:enemy, name: nil) } }

      it "raise an error on creation" do
        expect {
          post "/enemies", params: invalid_attributes
      }.to_not change(Enemy, :count)
      end
    end
  end
  describe "PUT /enemies" do
    context "when the enemy exists" do
      let(:enemy) { create(:enemy) }
      let(:enemy_attributes) { attributes_for(:enemy) }

      before(:each) { put "/enemies/#{enemy.id}", params: { enemy: enemy_attributes } }

      it "returns the http status 200" do
        expect(response).to have_http_status(200)
      end
      it "updates the enemy" do
        expect(enemy.reload).to have_attributes(json.except('created_at', 'updated_at'))
      end
      it "returns the enemy updated" do
        expect(enemy.reload).to have_attributes(enemy_attributes)
      end
    end

    context "when the enemy does not exist" do
      before(:each) { put "/enemies/0", params: { enemy:  attributes_for(:enemy) } }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match("Couldn't find Enemy")
      end
    end
  end

  describe "DELETE /enemies" do
    context "when the enemy exists" do
      let(:enemy) { create(:enemy) }
      before(:each) { delete "/enemies/#{enemy.id}" }

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
      it "destroy the record" do
        expect { enemy.reload }.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context "when the enemy does not exists" do
      before(:each) { delete "/enemies/0" }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to match("Couldn't find Enemy")
      end
    end
  end
end
