

function plotallS(numfig,S1P,S2P,T1P,T2P)

h=figure(numfig);
set(h(1),'WindowStyle','normal');
set(h(1),'Position',[1 1 700 700]);
set(h(1),'PaperPosition',[0 0 15 15]);
clf reset;

borde=0.1;
sepleg=0.03;
anchleg=0.12;

S=[ 0.5 0.5 0.5 0.5 0.5  0.25  0   0   0    0   0  1.0 1.0 1.0 1.5 1.5 1.5  1.5  -0.5  -0.5  -0.5  -0.5 -0.5  -0.5  -1.5 -1.5 -1.5 -1.5 0.5 1.0 1.0 0.75 0         1.75 1.25 -0.25 -0.75  0.25        0.25 -0.25 -0.75    1.75 0.75   1.25 0.75 ];
T=[ 0.5 1.0 1.5 2.5 -0.5 0.75 2.5 1.5 1.0  0.5 2.0 2.0 1.0  0  0.5 1.5 2.5 -0.5  0.5    1.0   2.5   1.5 2.0 -0.5  0.5 1.5 2.5 -0.5 2.0 1.5 1.0      0.25 2.0       1.25 1.75  -0.75 -0.25 1.25        -0.75  0.75  0.25   0.75 -0.25  0.25 1.75 ];


%S=[ 0.5 0.5 0.5 0.5 0.5 0.25 0.25 0.25 0.75 0 0 0 1.0 1.5 1.5 1.5 1.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.25 -1.5 -1.5 -1.5 -1.5 0.5 1.0 1.0 0.75 1.0 0];
%T=[ 0.5 1.0 1.5 2.5 -0.5 0.75 1.5 1.25 0.25 0.5 1.0 1.5 0 0.5 1.5 2.5 -0.5 0.5 1.0 1.5 2.0 2.5 -0.5 1.25 0.5 1.5 2.5 -0.5 2.0 1.5 1.0 1.5  2.0 2.0];
bin=0.33;

despleg=sepleg+anchleg;
anchuraP=1-2*borde -despleg;
bordex=borde;
bordey=borde+despleg;

axes('position',[bordex+anchuraP+sepleg bordey anchleg anchuraP]); axis off;
h=rectangle;
set(h(1),'FaceColor',[1 1 1]);
hold all;
for k=1:16
    [colorS,binS]=Scolor(k);
    h=rectangle('Position',[0.1 (16.5-k)*2*1/33 0.3 1/33]);
    set(h(1),'FaceColor',colorS);
    text(0.5,(16.75-k)*2*1/33,['\fontsize{10}' binS]);
end

axes('position',[bordex bordey anchuraP anchuraP]); axis([T1P T2P S1P S2P]);
xlabel('T');
ylabel('S');
hold all;
%grid;
box on;
h=line([-99 99], [99 -99]);
set(h(1),'Color','black');
set(h(1),'LineWidth',1.5);
set(h(1),'LineStyle',':');
h=line([-99 99], [-99 99]);
set(h(1),'Color','black');
set(h(1),'LineWidth',1.5);
set(h(1),'LineStyle','--');
h=line([-100 102], [100 -98]);
set(h(1),'Color','black');
set(h(1),'LineWidth',1.5);
set(h(1),'LineStyle','-.');
h=line([-99 99], [0 0]);
set(h(1),'Color','black');
set(h(1),'LineWidth',1.5);
%h=line([0 0], [-99 99]);
%set(h(1),'Color','black');
%set(h(1),'LineWidth',1.5);
h=line([1 1], [-99 99]);
set(h(1),'Color','black');
set(h(1),'LineWidth',1.5);
h=line([-99 99], [1 1]);
set(h(1),'Color','red');
h=line([-99 99], [-1 -1]);
set(h(1),'Color','red');
h=line([2 2], [-99 99]);
set(h(1),'Color','red');
h=line([0 0], [-99 99]);
set(h(1),'Color','red');

binx=bin*anchuraP/(S2P-S1P);
biny=bin*anchuraP/(T2P-T1P);


[t,iend]=size(S);
for i=1:iend
 if (S(i)-bin/2)>S1P && (S(i)+bin/2)<S2P && (T(i)-bin/2)>T1P && (T(i)+bin/2)<T2P
     
    Sh=(S(i)-S1P)*(anchuraP/(S2P-S1P))+bordey;
    Th=(T(i)-T1P)*(anchuraP/(T2P-T1P))+bordex;
    S1G=Sh-binx/2;
    S2G=Sh+binx/2;
    T1G=Th-biny/2; 
    T2G=Th+biny/2; 
    
    %axes('position',[bordex bordey anchuraP anchuraP]); axis off; axis([T1P T2P S1P S2P]);
    %h=line([T(i) T(i)], [-99 99]);
    %set(h(1),'Color',[0 0 0.9]);
    %set(h(1),'LineStyle','-.');
    %h=line([-99 99], [S(i) S(i)]);
    %set(h(1),'Color',[0 0 0.9]);
    %set(h(1),'LineStyle','-.');
    
    file=['data/S_' num2str(S(i)) '_T_' num2str(T(i)) '.mat'];
    disp(file);
    A=load(file,'-ascii');
    [t,nR]=size(A);
    nR=nR/18;
    
    switch nR
        case 1
            ny=1; nx=1;
        case 2
            ny=1; nx=2;
        case 3
            ny=2; nx=2;
        case 4
            ny=2; nx=2;
        case 5
            ny=2; nx=3;
        case 6
            ny=2; nx=3;
        case 7
            ny=3; nx=3;
        case 8
            ny=3; nx=3;
        case 9
            ny=3; nx=3;
        case 10
            ny=3; nx=4;
        case 11
            ny=3; nx=4;
        case 12
            ny=3; nx=4;
        case 13
            ny=4; nx=4;
        case 14
            ny=4; nx=4;
        case 15
            ny=4; nx=4;
        case 16
            ny=4; nx=4;
    end
            
    binxLT=binx/max([nx ny]);
    binyLT=biny/max([nx ny]);
    ampli=max([nx ny]);
    
    axes('position',[T1G,S1G,binx,biny]); axis off;
    h=rectangle;
    set(h(1),'EdgeColor',[0.5 0.5 0.5]);
    
    for iR=1:nR
        pm(iR)=A(1,(iR-1)*18+2);
    end
    maxP_R=max(pm);
    ampli=1/maxP_R;
    
    iy=0;
    for iR=1:nR
        ix=ceil(iR/nx); 
        %iy=floor(iR/ix);
        iy=iy+1;
        if iy>nx iy=1; end
        ejey=S1G+(ix-1)*(binyLT) +binyLT*(nx-ny)/2;
        ejex=T1G+(iy-1)*(binxLT);
                    
        clear P_asint_mix;
        clear node_asint_mix;
        clear node_asint_mix_num;
        nNR=A(1,(iR-1)*18+1);
        P_R=A(1,(iR-1)*18+2);
        P_asint=A(2:nNR+1,(iR-1)*18+2:(iR-1)*18+2);
        
        axes('position',[ejex+binxLT*(1-P_R*ampli)/2,ejey+binyLT*(1-P_R*ampli)/2,P_R*ampli*binxLT,P_R*ampli*binyLT]);
        axis;
        
        l=0;
        clear lreg;
        for j=1:nNR
         l2=0;
         for k=1:16
            if A(j+1,(iR-1)*18+2+k) > 0
                l=l+1;
                l2=l2+1;
                P_asint_mix(l)= A(j+1,(iR-1)*18+2+k) * P_asint(j);
                %node_asint_mix{l}=int2str(k);
                node_asint_mix{l}='';
                node_asint_mix_num(l)=k;
                lreg(j,l2)=l;
            end
         end
        end

        h=pie(P_asint_mix,node_asint_mix);
        for k=1:l
           [colorS,binS]=Scolor(node_asint_mix_num(k));
           set(h(2*k-1),'FaceColor',colorS); 
           set(h(2*k-1),'LineStyle','none');  
        end    
        
        if l==1
            vcat=get(h(1),'Vertices');
            [vcatf,t]=size(vcat);
            vcat(1,:)=[0 1];
            vcat(vcatf,:)=[0 1];
            set(h(1),'Vertices',vcat);
        end
        
        [t,kfin]=size(lreg);
        for j=1:nNR
          if nNR==1 vertenv=[0 1]; else vertenv=[0 0]; end
          for k=1:kfin
            if lreg(j,k)>0
                clear vcat;
                vcat=get(h(lreg(j,k)*2-1),'Vertices');
                [vcatf,t]=size(vcat);
                vertenv=cat(1,vertenv,vcat(2:vcatf-1,:));
            end
          end
          [vertenvf,t]=size(vertenv);
          if nNR>1 vertenv(vertenvf+1,:)=[0 0]; end
          hold on;
          %hline=plot(vertenv(:,1),vertenv(:,2),'w-');
          %set(hline(1),'LineWidth',4.0);  
          hline=plot(vertenv(:,1),vertenv(:,2),'k-');
          %set(hline(1),'LineWidth',2.0);
          
        end
        
        
    end
    
 end  
end



%axes('position',[bordex bordey anchuraP anchuraP]); axis([T1P T2P S1P S2P]); axis off;
%h=line([-99 99], [0 0]);
%set(h(1),'Color','black');
%h=line([0 0], [-99 99]);
%set(h(1),'Color','black');
%h=line([1 1], [-99 99]);
%set(h(1),'Color','black');
%h=line([-99 99], [1 1]);
%set(h(1),'Color','red');
%h=line([-99 99], [-1 -1]);
%set(h(1),'Color','red');
%h=line([2 2], [-99 99]);
%set(h(1),'Color','red');
%h=line([0 0], [-99 99]);
%set(h(1),'Color','red');







filename=['plots/plot_S_' num2str(S1P) '_' num2str(S2P) '_T_' num2str(T1P) '_' num2str(T2P)];
filenameps=[filename '.ps'];
filenamepdf=[filename '.pdf'];
print ('-dpsc',filenameps);
fileps2pdf=['ps2pdf -sPAPERSIZE=a2 ' filenameps ' ' filenamepdf];
system(fileps2pdf);
zippdf=['zip plots/plots_pdf ' filenamepdf];
system(zippdf);

clear;

end


function [colorS,binS]=Scolor(k)

switch k
    case 1
        colorS=[0.2 0.4 0];
        binS='\bf{0000}';
    case 2
        colorS=[0 1 0];
        binS='\bf{0001}';
    case 3
        colorS=[1 0.9 0.8];
        binS='\bf{0010}';
    case 4
        colorS=[0.5 0 0.9];
        binS='\bf{0011}';
    case 5
        colorS=[1 1 0];
        binS='\bf{0100}';
    case 6
        colorS=[1 0.7 0.3];
        binS='\bf{0101}';
    case 7
        colorS=[0.9 0.9 0.9];
        binS='\bf{0110}';
    case 8
        colorS=[0.8 0.6 0.7];
        binS='\bf{0111}';
    case 9
        colorS=[0 0.5 0.9];
        binS='\bf{1000}';
    case 10
        colorS=[0 0 1];
        binS='\bf{1001}';
    case 11
        colorS=[1 0.8 1];
        binS='\bf{1010}';
    case 12
        colorS=[0.6 0.5 0.4];
        binS='\bf{1011}';
    case 13
        colorS=[0 0.8 1];
        binS='\bf{1100}';
    case 14
        colorS=[0.6 0.2 0];
        binS='\bf{1101}';
    case 15
        colorS=[0.78 0.12 0.04 ];
        binS='\bf{1110}';
    case 16
        colorS=[1 0 0];
        binS='\bf{1111}';       
end 

end

