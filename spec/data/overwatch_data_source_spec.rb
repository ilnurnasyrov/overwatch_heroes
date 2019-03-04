require "overwatch_data_source"

RSpec.describe OverwatchDataSource, type: :integration do
  it_behaves_like_overwatch_data_source(OverwatchDataSource.new)

  let(:data_source) { OverwatchDataSource.new }

  describe "#heroes" do
    it "returns enumerable to iterate over all heroes" do
      expect(data_source.heroes).to be_an Enumerable

      heroes = data_source.heroes.to_a

      expect(heroes.first).to be_an Hero
      expect(heroes.count).to eq 24
    end
  end

  describe "#abilities" do
    it "returns enumerable to iterate over all abilities" do
      expect(data_source.abilities).to be_an Enumerable

      abilities = data_source.abilities.to_a

      expect(abilities.first).to be_an Ability
      expect(abilities.count).to eq 114
    end
  end

  describe "Abilities" do
    let(:abilities) { OverwatchDataSource::Abilities.new }

    describe "#to_a" do
      it "returns collection of Abilities" do
        expect(abilities.to_a).to be_an Array
        expect(abilities.to_a.count).to eq 50
        expect(abilities.to_a.first).to be_an Ability
      end
    end

    describe "#next" do
      it "returns next page" do
        next_abilities = abilities.next

        expect(next_abilities.to_a).to be_an Array
        expect(next_abilities.to_a.count).to eq 50
        expect(next_abilities.to_a.first).to be_an Ability
      end
    end
  end

  describe "Heroes" do
    let(:heroes) { OverwatchDataSource::Heroes.new }

    describe "#to_a" do
      it "returns collection of Heroes" do
        expect(heroes.to_a).to be_an Array
        expect(heroes.to_a.count).to eq 24
        expect(heroes.to_a.first).to be_a Hero
      end
    end
  end
end
