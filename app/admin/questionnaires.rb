ActiveAdmin.register Questionnaire do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :title,
                questions_attributes: [:id, :text, answers_attributes: [:id, :text, :is_correct]]

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Questionnaire' do
      f.input :title
    end
    f.inputs 'Questions' do
      f.has_many :questions, heading: false,
                             allow_destroy: true do |a|
        a.input :text, label: 'Question'
        a.has_many :answers, heading: false,
                             allow_destroy: true do |t|
          t.input :text, label: 'Answer'
          t.input :is_correct
        end
      end
    end
    f.actions
  end
end
