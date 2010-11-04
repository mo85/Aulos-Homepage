# encoding: utf-8 
class Membership < ActiveRecord::Base
  belongs_to :person
  belongs_to :project
  belongs_to :instrument
  
  validates_presence_of :person_id
  validates_presence_of :project_id
  
  scope :clarinets, includes("instrument").where("instruments.name = ?", "Klarinette")

  scope :flutes, includes("instrument").where("instruments.name = ?", "Flöte")
  
  scope :trumpets, includes("instrument").where("instruments.name = ?", "Trompete")

  scope :saxophones, includes("instrument").where("instruments.name = ?", "Saxophon")
  
end
