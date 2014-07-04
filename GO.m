probes = textread('/Users/liz/Documents/workspace/Microarray/GO-Ovary.txt','%s','delimiter','\n','whitespace','');
no=1;
for i=1:length(probes)
    line=probes{i};
    s=strfind(line,' ');
    if(i==1)
        GOterm(no).probe=line(s(1)+2:s(2)-2);
        if(isempty(line(s(2)+2:s(3)-2))||strcmp(line(s(4)+2:length(line)-1),'BP'))
            GOterm(no).num=0;
            GOterm(no).GOid{1}='';
            GOterm(no).evidence{1}='';
            GOterm(no).ontology{1}='';
        else
            GOterm(no).num=1;
            GOterm(no).GOid{1}=line(s(2)+2:s(3)-2);
            GOterm(no).evidence{1}=line(s(3)+2:s(4)-2);
            GOterm(no).ontology{1}=line(s(4)+2:length(line)-1);
        end
    else
        if(strcmp(line(s(1)+2:s(2)-2),GOterm(no).probe))
            if(~strcmp(line(s(4)+2:length(line)-1),'BP'))
                GOterm(no).num=GOterm(no).num+1;
                num=GOterm(no).num;
                GOterm(no).GOid{num}=line(s(2)+2:s(3)-2);
                GOterm(no).evidence{num}=line(s(3)+2:s(4)-2);
                GOterm(no).ontology{num}=line(s(4)+2:length(line)-1);
            end
        else
            no=no+1;
            GOterm(no).probe=line(s(1)+2:s(2)-2);
            if(isempty(line(s(2)+2:s(3)-2)) || strcmp(line(s(4)+2:length(line)-1),'BP'))
                GOterm(no).num=0;
                GOterm(no).GOid{1}='';
                GOterm(no).evidence{1}='';
                GOterm(no).ontology{1}='';
            else
                GOterm(no).num=1;
                GOterm(no).GOid{1}=line(s(2)+2:s(3)-2);
                GOterm(no).evidence{1}=line(s(3)+2:s(4)-2);
                GOterm(no).ontology{1}=line(s(4)+2:length(line)-1);
            end
        end
    end
end

