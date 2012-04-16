Fabricator(:comment) do
  content "This is a comment"
  user!
end

Fabricator(:article_comment, :from => :comment) do
  commentable!(:fabricator => :article)
end
