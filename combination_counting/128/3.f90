program main
  implicit none
  integer :: input_limit
  integer(kind=8), dimension(:), allocatable :: array
  read *, input_limit
  allocate(array(input_limit))
  print *, execute(1, input_limit, array)
  deallocate(array)
  contains
    recursive function factorial(num, total) result(num_factorial)
      integer, intent(in) :: num
      real(kind=8), intent(in) :: total
      real(kind=8) :: num_factorial
      num_factorial = total
      if ( num == 0 ) then
        return
      else
        num_factorial = factorial(num - 1, num * total)
      end if
    end function factorial

    function combinatory(n, k) result(combination)
      integer, intent(in) :: n, k
      real(kind=8) :: n_fact, k_fact, rest_fact, combination, total
      total = 1
      n_fact = factorial(n, total)
      k_fact = factorial(k, total)
      rest_fact = factorial(n - k, total)
      combination = n_fact / (k_fact * rest_fact)
    end function combinatory

    recursive function execute(counter, limit, array) result(array_result)
      integer, intent(in) :: counter, limit
      integer(kind = 8), dimension(:), intent(in) :: array
      integer(kind = 8), dimension(:), allocatable :: array_result
      integer :: n, k
      integer(kind = 8) :: combinatory_num
      array_result = array
      if ( counter > limit ) then
        return
      else
        read *, n, k
        combinatory_num = int(anint(combinatory(n, k), kind=8), kind=8)
        array_result(counter) = combinatory_num
        array_result = execute(counter + 1, limit, array_result)
      end if
    end function execute
end program main
