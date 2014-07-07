function [ w ] = weight(GOterm,file,no1,no2 )
for i =no1:no2
    a=GOterm(i).num;
    for j=1:i
        b=GOterm(j).num;
        if(b~=0 && a~=0 && i~=j)
            c=0;
            for m=1:a
                for n=1:b
                    if(strcmp(GOterm(i).GOid{m},GOterm(j).GOid{n}))
                        c=c+1;
                    end
                end
            end
            w(i-no1+1,j)=c/(a+b-c);
        else
            w(i-no1+1,j)= 0;
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

