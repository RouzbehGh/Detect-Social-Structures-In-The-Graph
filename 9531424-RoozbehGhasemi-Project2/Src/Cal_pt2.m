function pt1 = Cal_pt2(vj_users)
    %in function pt1 ra mohasebe mikonad
    len=size(vj_users,2);
    wji=0;
    WSum=0;
    for i=1:len
        wji=CreateRandom();
        WSum=WSum+wji;
    end
    pt1=WSum/len;
end

