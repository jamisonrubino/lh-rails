class WikiPolicy < ApplicationPolicy
    
    
   class Scope
     attr_reader :user, :scope
 
     def initialize(user, scope)
       @user = user
       @scope = scope
     end
 
     def resolve
       wikis = []
       if @user && @user.role == 'admin'
         wikis = scope.all # if the user is an admin, show them all the wikis
       elsif @user && @user.role == 'premium'
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if !wiki.private || wiki.user_id == user.id || wiki.users.pluck(:id).include?(user.id)
             wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
           end
         end
       elsif @user && @user.role == 'standard' # this is the lowly standard user
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if !wiki.private || wiki.user_id == user.id || wiki.users.pluck(:id).include?(user.id)
             wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
           end
         end
       else
         all_wikis = scope.all
         all_wikis.each do |wiki|
            if !wiki.private
               wikis << wiki
            end
         end
       end
       wikis # return the wikis array we've built up
     end
   end 
end