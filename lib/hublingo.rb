require 'octokit'

# @author Dave Goodchild
class Hublingo

  attr_accessor :repos
  attr_accessor :frequencies

  # Constructor initializes repos array and frequencies hash.
  def initialize
    @repos = []
    @frequencies = Hash.new(0)
  end

  # Returns the size of the repos array.
  # @return [Fixnum] the size of the array.
  def size
    repos.size
  end

  # Given a Github user name, retrieves all public repos for that.
  # user and assembles a hash containing language frequency.
  # @param hacker [String] the Github username
  # @return [String] error response or favourite language.
  def lingo(hacker)
    @repos = Octokit.repos(hacker)
    languages || "Sorry that hacker has no public repos!"
  rescue Octokit::NotFound
    "That hacker doesn't exist baby."
  rescue Octokit::TooManyRequests
    "Uh oh! Rate limit! Please try again at #{Octokit.rate_limit.resets_at}"
  end

  # Cycles through the repos and builds a hash of language frequencies.
  # @return [String] of most used language.
  def languages
    if repos.any?
      repos.each do |repo|
        Octokit.languages(repo.full_name).fields.each do |field|
          frequencies[field] += 1
        end
      end
      return pick
    end
    false
  end

  def pick
    frequencies.sort_by {|k, v| - v}.first.first.to_s
  end
end
