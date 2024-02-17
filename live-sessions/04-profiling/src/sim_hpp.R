sim_hpp <- function(lambda = 0.2, t_max = 100, offset = 3){

  event_times <- c()
  event_marks <- c()
  t <- 0

  time_to_first_event <- rexp(n = 1, rate = lambda)
  t <- t + time_to_first_event

  while (t < t_max) {
    event_times <- c(event_times, t)
    event_marks <- c(event_marks, offset + rexp(n = 1, rate = 1))
    time_to_next_event <- rexp(n = 1, rate = lambda)
    t <- t + time_to_next_event
  }

  point_pattern <- data.frame(time = event_times, mark = event_marks)

  # return the data.frame so that it can be stored, but do not print to console
  invisible(point_pattern)
}
