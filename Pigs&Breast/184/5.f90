program main
  implicit none
  integer :: n_cases, limit
  character(15), allocatable :: cases(:, :)
  read(*, *) n_cases
  allocate(cases(n_cases, 3))
  limit = 1
  call match_pick(n_cases, limit)
  contains
    recursive subroutine match_pick(n_cases, limit)
      implicit none
      integer, intent(in) :: n_cases
      integer :: limit, result
      integer :: m, k
      character(1) :: rule
      character(6) :: fmt, fmt_2, result_ch
      fmt = '(I3)'
      fmt_2 = '(A)'
      if (limit <= n_cases) then
        read(*, *) m, k, rule
        if (rule == 'n') then
          result = mod(m, (k + 1))
        else
          result = mod(m, (k + 1)) - 1
          if (result < 0) then
            result = k
          else
          end if
        end if
        write(result_ch, fmt) result
        write(*, fmt_2, advance = "no") trim(result_ch)
        call match_pick(n_cases, limit + 1)
      else
      end if
    end subroutine match_pick
end program main
