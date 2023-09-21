program prove_triangule
  implicit none
  integer :: amount, i, A, B, C, aux
  integer, DIMENSION(:), ALLOCATABLE :: triangule
  read *, amount
  ALLOCATE(triangule(amount))
  do i = 1, amount
    read *, A, B, C
    if (((A+B) > C) .and. ((B+C) > A) .and. ((C+A) > B)) then
      aux = 1
    else
      aux = 0
    end if
    triangule(i) = aux
  end do
  write(*,'(*(I2))')(triangule)
end program prove_triangule
