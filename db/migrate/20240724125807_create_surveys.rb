class CreateSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :description
      # survey_data: [{"label"=>"test", "inputs"=>"test"}, {"label"=>"test", "inputs"=>"test"}]
      t.jsonb :survey_data, default: []

      t.timestamps
    end
  end
end
