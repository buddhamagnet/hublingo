require 'octokit'

class Hublingo

	attr_accessor :repos
  attr_accessor :frequencies

  def initialize
  	@repos = []
    @frequencies = Hash.new(0)
  end

  def size
    repos.size
  end

  def lingo(hacker)
  	@repos = Octokit.repos(hacker)
  	languages || "Sorry that hacker has no repos!"
  rescue Octokit::NotFound
  	"That hacker doesn't exist baby."
  rescue Octokit::TooManyRequests
  	"You're too greedy, wait for a while."
  end

  def languages
    if repos.any?
      repos.each do |repo|
        Octokit.languages(repo.full_name).fields.each do |field|
          frequencies[field] += 1
        end
      end
      frequencies.sort_by {|k, v| - v}.first.first.to_s
      return frequencies
    end
    false
  end
end
