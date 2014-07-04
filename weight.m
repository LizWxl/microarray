function [ w ] = weight( GO,file,no1,no2 )
load GO
for i =no1:no2
    a=GOterm(i).num;
    for j=1:i-1
        b=GOterm(j).num;
        if(b~=0 && a~=0)
            c=0;
            for m=1:a
                for n=1:b
                    if(strcmp(GOterm(i).GOid{m},GOterm(j).GOid{n}))
                        c=c+1;
                    end
                end
            end
            w(i,j)=c/(a+b-c);
            w(j,i)=w(i,j);
        else
            w(i,j)= -1;
            w(j,i)=w(i,j);
        end
    end
    i
end

[m,n]=size(w);

fid = fopen(file,'wt');
p=num2str(m);
fprintf(fid,'%c',p);
fprintf(fid,'%c\n',' ');
for i=1:m
    for j=1:n
        p=num2str(w(i,j));
        fprintf(fid,'%c',p);
        fprintf(fid,'%c',' ');
    end
    fprintf(fid,'%c\n',' ');
end
fclose(fid);


end

