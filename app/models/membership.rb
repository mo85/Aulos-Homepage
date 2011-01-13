# encoding: utf-8 
class Membership < ActiveRecord::Base
  belongs_to :instrumentalist
  belongs_to :project
  belongs_to :instrument
  
  validates_presence_of :instrumentalist_id
  validates_presence_of :project_id
  
  scope :clarinets, includes("instrument").where("instruments.name = ?", "Klarinette")

  scope :flutes, includes("instrument").where("instruments.name = ?", "Flöte")
  
  scope :trumpets, includes("instrument").where("instruments.name = ?", "Trompete")

  scope :saxophones, includes("instrument").where("instruments.name = ?", "Saxophon")
  
  default_scope includes("instrumentalist").order("people.lastname")
  
end
