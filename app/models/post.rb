class Post < ApplicationRecord
validates :title, presence: true,
validates :content, :length {minimum:250}
validates :summary, :length {maximum:250}
validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
validates :clickbait?

CLICKBAIT_PATTERNS  = [
  /Won't Believe/i,
  /Secret/i,
  /Top \d/i,
  /Guess/i
]
def clickbait
  if CLICKBAIT_PATTERNS.none? { |pat| pat.match title}
  errors.add(:title,"must be clickbait")
  # It uses the none? method on the CLICKBAIT_PATTERNS array. The none? method checks if none of the elements in the array satisfy the given block condition.
# The block condition uses the match method on each pattern (pat) to check if the title matches the pattern. If the title matches any pattern, the none? method returns false, indicating that the title is clickbait.
# If the none? method returns false, it means the title is clickbait, so the method doesn't add any errors.
# If the none? method returns true, it means the title doesn't match any clickbait pattern, so the method adds an error to the title attribute using errors.add.

end
end

end
