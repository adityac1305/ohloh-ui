class CodeSet < ActiveRecord::Base
  belongs_to :repository
  belongs_to :best_sloc_set, foreign_key: :best_sloc_set_id, class_name: SlocSet
  has_many :commits, -> { order(:position) }, dependent: :destroy
  has_many :fyles, dependent: :delete_all
  has_many :sloc_sets, dependent: :destroy

  def ignore_prefixes(project)
    enlistment = project.enlistments.find_by(repository_id: repository_id)
    enlistment.nil? ? CodeSet.none : enlistment.analysis_sloc_set.ignore_prefixes
  end
end