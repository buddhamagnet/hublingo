require 'octokit'

class Hublingo

	attr_accessor :repos

  def initialize
  	@repos = []
  end

  def lingo(hacker)
  	@repos = Octokit.repos(hacker)
  	languages
  rescue Octokit::NotFound
  	"That hacker doesn't exist baby."
  rescue Octokit::TooManyRequests
  	"You're too greedy, wait for a while."
  end

  def languages
  	1.upto(5) do |i|
  		puts repos[i].full_name
  	end
  end
end