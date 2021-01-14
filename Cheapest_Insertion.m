clc;
clear all;

   distance_matrix=[ 0 9 3 5 3 6 ;
                   9 0 7 5 7 4 ;
                   3 7 0 3 2 6 ;
                   5 5 3 0 4 3 ;
                   3 7 2 4 0 3 ;
                   6 4 6 3 3 0 ];


% generating a random distance matrix
% -----------------------------------
% a = randi([50,100],10,10);
% 
% [m,n] = size(a);
% 
% for i = 1:m
%     for j = 1:n
%         if i==j
%             a(i,j)=0;
%         else
%             a(i,j) = a(j,i);
%         end
%     end
% end
% disp(a)
% distance_matrix = a;

               
    [row,column]=size(distance_matrix);

    path=[];
    best_solution1=1000000;
    enk=max(max(distance_matrix));

    for i=1:row
        for j=1:column
            if i~=j && distance_matrix(i,j)<enk
                enk=distance_matrix(i,j);
                path(1)=i; a=i;
                path(2)=j; b=j;
            end
        end
    end
%     distance(a,b)=0; distance(b,a)=0;
    
    path;
    city=1:column;
    s=0;
    while length(city)~=column-2
        s=s+1;
        if city(s)==a || city(s)==b
            city(s)=[];
            s=0;
        end
    end
    candidate=[];
    
    while length(path)~=row
        
        for i=1:length(city)
            
            if city(i)~=0
                for j=1:length(path)+1
                    if j==1
                        candidate=[city(i) path];
                    elseif j==length(path)+1
                        candidate=[path city(i)];
                    else
                    part1=path(1:j-1);
                    part2=path(j:length(path));
                    candidate=[part1 city(i) part2];
                    end

                    total=0;
                    for k=1:length(candidate)-1
                        total=total+distance_matrix(candidate(k),candidate(k+1));
                    end
                    total=total+distance_matrix(candidate(1),candidate(k+1));

                    if total<best_solution1
                            best_solution1=total;
                            best=candidate;
                            p=i;
                    end

                end
            end
        end
            path=best;
            best_solution=best_solution1;
            city(p)=0;
            best_solution1=100000;
    end
    
    path 
    best_solution
    
                   