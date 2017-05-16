%jill(width(15m))
%x(a(v1)

:- add_rule(
       initiate_smaller
       if
        not(left_of(_,x(criterion(A)))) and
        not(left_of(x(criterion(A)),_))
       then
        add(left_of(x(criterion(A)),_)) and
        add(smallest(x(criterion(A)))) and
        add(not(latest(_))) and
        add(latest(x(criterion(A))))
   ).


:- add_rule(
       update_smaller
       if
        smallest(x(criterion(A))) and
        (value(x,criterion(A),_))<(value(y,criterion(A),_))
       then
        add(left_of(y(criterion(A)),y(criterion(A)))) and
        add(not(smallest(x(criterion(A))))) and
        add(smallest(y(criterion(A)))) and
        add(sorting(criterion(A))) and
	add(not(latest(_))) and
        add(latest(y(criterion(A))))

   ).

:- add_rule(
       end_smaller
       if
        smallest(_)
       then
        end
   ).

:- add_rule(
       initiate_sort
       if
        not(sorting(criterion(A))) and
        smallest(x(criterion(A)))
       then
        add(not(sorting(criterion(A)))) and
        add(not(smallest(x(criterion(A))))) and
        add(sorted(x(criterion(A)))) and
        add(sorting(criterion(A))) and
        delete(latest(_)) and
        add(latest(x(criterion(A)))) and
        remove(criterion(A)) and
        add(criterion(A))

   ).

:- add_rule(
       extend_sort
       if
        sorting(criterion(A)) and
        smallest(x(criterion(A))) and
        sorted(y(criterion(A))) and
        latest(y(criterion(A)))
       then
        add(not(sorting(criterion(A)))) and
        add(not(sorted(x(criterion(A))))) and
        delete(latest(_)) and
        add(lastest(x(criterion(A)))) and
        add(left_of(x(criterion(A)),y(criterion(A)))) and
        remove(criterion(A)) and
        add(criterion(A))
   ).

:- add_rule(
       end_sort
       if
        criterion(A)
       then
        end
   ).
