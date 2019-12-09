# Easy Progress Bar
# 
# Usage:
#     open url, **pbar.kwargs

class PBar
  # [===>      ] 42.35%
  BAR = -> cur, max {
    n = 20
    s = '=' * (cur * n / max)
    t = ' ' * (n - s.size)
    t[0] = '>' if s.size < n
    "\e[u\e[K[#{s}#{t}] #{'%.02f%%' % (100 * cur).fdiv(max)}"
  }

  def initialize
    @max = 0
  end

  def content_length_proc
    -> len { @max = len; print "\e[s" }
  end

  def progress_proc
    -> x { print BAR[x, @max] if @max > 0 }
  end

  def kwargs
    { content_length_proc: content_length_proc,
      progress_proc:       progress_proc }
  end
end

def pbar
  @pbar ||= PBar.new
end
