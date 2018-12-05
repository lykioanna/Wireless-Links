function WinnerPlot()

d=50;
A=20;
B=46.4;
C=20;
X=0;

fc1=2;
fc2=6;



%DISTANCE
L=3:10:100;

PLfree1=zeros(1,length(L)); PLfree2=zeros(1,length(L));

LOS1=zeros(1,length(L)); LOS2=zeros(1,length(L));

NLOS1wh1=zeros(1,length(L)); NLOS1wh2=zeros(1,length(L));
NLOS1wl1=zeros(1,length(L)); NLOS1wl2=zeros(1,length(L));

NLOS2wh1=zeros(1,length(L)); NLOS2wh2=zeros(1,length(L));
NLOS2wl1=zeros(1,length(L)); NLOS2wl2=zeros(1,length(L));

NLOS1wl_FL1=zeros(1,length(L)); NLOS1wl_FL2=zeros(1,length(L));

NLOS2wl_FL1=zeros(1,length(L)); NLOS2wl_FL2=zeros(1,length(L));



%A1  
for i=1:length(L)
    PLfree1(1,i)=Winner(L(i),A,B,C,fc1,X); %PLfree 2GHz
    PLfree2(1,i)=Winner(L(i),A,B,C,fc2,X); %PLfree 6GHz
    
    LOS1(1,i)=Winner(L(i),18.7,46.8,20,fc1,X); %A1 LOS 2GHz
    LOS2(1,i)=Winner(L(i),18.7,46.8,20,fc2,X); %A1 LOS 6GHz
    
    %Corridor-to-room    
    n1=1; %number of walls
    n2=2;
    Xl=5*(n2-1); %light walls
    Xh=12*(n1-1); %heavy walls
    
    %NLOS1 heavy walls
    NLOS1wh1(1,i)=Winner(L(i), 36.8, 43.8, 20, fc1,Xh); %freq=2
    NLOS1wh2(1,i)=Winner(L(i), 36.8, 43.8, 20, fc2,Xh); %freq=6
    
    %NLOS1 light walls
    NLOS1wl1(1,i)=Winner(L(i), 36.8, 43.8, 20, fc1,Xl); %freq=2
    NLOS1wl2(1,i)=Winner(L(i), 36.8, 43.8, 20, fc2,Xl); %freq=6
    
    %Room-to-room
    Xh2=12*n1;
    Xl2=5*n2;
    
    %NLOS2 heavy walls
    NLOS2wh1(1,i)=Winner(L(i), 20, 46.4, 20, fc1, Xh2); %freq=2
    NLOS2wh2(1,i)=Winner(L(i), 20, 46.4, 20, fc2, Xh2); %freq=6
    
    %NLOS2 light walls
    NLOS2wl1(1,i)=Winner(L(i), 20, 46.4, 20, fc1, Xl2); %freq=2
    NLOS2wl2(1,i)=Winner(L(i), 20, 46.4, 20, fc2, Xl2); %freq=6
    
    nf= 2; %no of floors between BS and MS nf>0
    FL= 17+4*(nf-1);
    
    NLOS1wl_FL1(1,i)=Winner(L(i), 36.8, 43.8, 20, fc1,Xl) + FL; 
    NLOS1wl_FL2(1,i)=Winner(L(i), 36.8, 43.8, 20, fc2,Xl) + FL;
    
    NLOS2wl_FL1(1,i)=Winner(L(i), 20, 46.4, 20, fc1,Xl2)+ FL;
    NLOS2wl_FL2(1,i)=Winner(L(i), 20, 46.4, 20, fc2,Xl2)+ FL;

end
    
    figure;
    
    subplot(3,1,1); title('Scenario A1: PLfree vs LOS');
    plot(L,PLfree1, 'k', L,PLfree2, 'b', L,LOS1, 'm', L,LOS2, 'g');
    
    legend('PLfree freq=2', 'PLfree freq=6', 'LOS freq=2', 'LOS freq=6');
    xlabel('Distance(m)');
    ylabel('Path Loss(PL)');
    title('Scenario A1: PLfree vs LOS');
    grid on;
    
    subplot(3,1,2); 
    plot(L, LOS1, 'b', L, LOS2, 'm', L,NLOS1wh1, 'y', L,NLOS1wh2, 'g', L,NLOS1wl1, 'c', L,NLOS1wl2, 'k');
    legend('LOS freq=2', 'LOS freq=6', 'NLOS1 heavy wall freq=2', 'NLOS1 heavy wall freq=6', 'NLOS1 light wall freq=2', 'NLOS1 light wall freq=6');
    
    xlabel('Distance(m)');
    ylabel('Path Loss(PL)');
    title('Scenario A1: LOS vs NLOS1 (light[2] +heavy[1] walls)');
    grid on;
    
    subplot(3,1,3); 
    plot(L, LOS1, 'b', L, LOS2, 'm', L,NLOS2wh1, 'y', L,NLOS2wh2, 'g', L,NLOS2wl1, 'c', L,NLOS2wl2, 'k');
    legend('LOS freq=2', 'LOS freq=6', 'NLOS2 heavy wall freq=2', 'NLOS2 heavy wall freq=6', 'NLOS2 light wall freq=2', 'NLOS2 light wall freq=6');
    
    xlabel('Distance(m)');
    ylabel('Path Loss(PL)');
    title('Scenario A1: LOS vs NLOS2 (light[2] +heavy[1] walls)');
    grid on;
    
    
    %FREQUENCY
    d1=3; d2=100;
    fc=2:0.01:6;
    
    f_PLfree1=zeros(1,length(fc)); f_PLfree2=zeros(1,length(fc));
    
    f_LOS1=zeros(1,length(fc)); f_LOS2=zeros(1,length(fc));
    
    f_NLOS1wh1=zeros(1,length(fc)); f_NLOS1wh2=zeros(1,length(fc));
    f_NLOS1wl1=zeros(1,length(fc)); f_NLOS1wl2=zeros(1,length(fc));
    
    f_NLOS2wh1=zeros(1,length(fc)); f_NLOS2wh2=zeros(1,length(fc));
    f_NLOS2wl1=zeros(1,length(fc)); f_NLOS2wl2=zeros(1,length(fc));
    
    f_NLOS1wl_FL1=zeros(1,length(fc)); f_NLOS1wl_FL2=zeros(1,length(fc));
    f_NLOS2wl_FL1=zeros(1,length(fc)); f_NLOS2wl_FL2=zeros(1,length(fc));
    
    
    for i=1:length(fc)
        
    f_PLfree1(1,i)=Winner(d1,A,B,C,fc(i),X); %PLfree d1=3
    f_PLfree2(1,i)=Winner(d2,A,B,C,fc(i),X); %PLfree d2=100
    
    f_LOS1(1,i)=Winner(d1,18.7,46.8,20,fc(i),X); %A1 LOS d1=3
    f_LOS2(1,i)=Winner(d2,18.7,46.8,20,fc(i),X); %A1 LOS d2=100
    
    %NLOS1 heavy walls
    f_NLOS1wh1(1,i)=Winner(d1, 36.8, 43.8, 20, fc(i),Xh); %d1=3
    f_NLOS1wh2(1,i)=Winner(d2, 36.8, 43.8, 20, fc(i),Xh); %d2=100
    
    %NLOS1 light walls
    f_NLOS1wl1(1,i)=Winner(d1, 36.8, 43.8, 20, fc(i),Xl); 
    f_NLOS1wl2(1,i)=Winner(d2, 36.8, 43.8, 20, fc(i),Xl); 
    
    %NLOS2 heavy walls
    f_NLOS2wh1(1,i)=Winner(d1, 20, 46.4, 20, fc(i), Xh2); 
    f_NLOS2wh2(1,i)=Winner(d2, 20, 46.4, 20, fc(i), Xh2); 
    
    %NLOS2 light walls
    f_NLOS2wl1(1,i)=Winner(d1, 20, 46.4, 20, fc(i), Xl2); 
    f_NLOS2wl2(1,i)=Winner(d2, 20, 46.4, 20, fc(i), Xl2); 
    
    f_NLOS1wl_FL1(1,i)=Winner(d1, 36.8, 43.8, 20, fc(i),Xl) + FL; 
    f_NLOS1wl_FL2(1,i)=Winner(d2, 36.8, 43.8, 20, fc(i),Xl) + FL; 
    
    f_NLOS2wl_FL1(1,i)=Winner(d1, 20, 46.4, 20, fc(i),Xl2)+ FL; 
    f_NLOS2wl_FL2(1,i)=Winner(d2, 20, 46.4, 20, fc(i),Xl2)+ FL;
    
    
    end
    
    figure;
    
    subplot(3,1,1); 
    plot(fc,f_PLfree1, 'k', fc,f_PLfree2, 'b', fc,f_LOS1, 'm', fc,f_LOS2, 'g');
    
    legend('PLfree dist=3', 'PLfree fdist=100', 'LOS dist=3', 'LOS dist=100');
    xlabel('Frequency(GHz)');
    ylabel('Path Loss(PL)');
    title('Scenario A1: PLfree vs LOS');
    grid on;
    
    subplot(3,1,2); 
    plot(fc, f_LOS1, 'b', fc, f_LOS2, 'm', fc,f_NLOS1wh1, 'y', fc,f_NLOS1wh2, 'g', fc,f_NLOS1wl1, 'c', fc,f_NLOS1wl2, 'k');
    legend('LOS dist=3', 'LOS dist=100', 'NLOS1 heavy wall dist=3', 'NLOS1 heavy wall dist=100', 'NLOS1 light wall dist=3', 'NLOS1 light wall dist=100');
    
    xlabel('Frequency(GHz)');
    ylabel('Path Loss(PL)');
    title('Scenario A1: LOS vs NLOS1 (light[2] +heavy[1] walls)');
    grid on;
    
    subplot(3,1,3);
    plot(fc, f_LOS1, 'b', fc, f_LOS2, 'm', fc,f_NLOS2wh1, 'y', fc,f_NLOS2wh2, 'g', fc,f_NLOS2wl1, 'c', fc,f_NLOS2wl2, 'k');
    legend('LOS d=3', 'LOS d=100', 'NLOS2 heavy wall d=3', 'NLOS2 heavy wall d=100', 'NLOS2 light wall d=3', 'NLOS2 light wall d=100');
    
    xlabel('Frequency(GHz)');
    ylabel('Path Loss(PL)');
    title('Scenario A1: LOS vs NLOS2 (light[2] +heavy[1] walls)');
    grid on;
    
    
    figure;
    subplot(3,1,1);
    plot(L, NLOS1wh1,'k', L ,NLOS1wh2, 'b', L, NLOS1wl_FL1, 'g', L, NLOS1wl_FL2, 'c',L, NLOS2wl_FL1,'y', L, NLOS2wl_FL2, 'm');
    legend('NLOS1 heavy wall freq=2', 'NLOS2 heavy wall freq=6', 'NLOS1 light wall + FL freq=2', 'NLOS1 light wall +FL freq=6', 'NLOS2 light wall +FL freq=2', 'NLOS2 light wall +FL freq=6');
    xlabel('Distance(m)');
    ylabel('Path Loss(PL)');
    title('Scenario A1: NLOS1 vs NLOS2 (light and heavy walls) including FL');
    grid on;
    
    
    subplot(3,1,2);
    plot(fc, f_NLOS1wh1,'k', fc ,f_NLOS1wh2, 'b', fc, f_NLOS1wl_FL1, 'g', fc, f_NLOS1wl_FL2, 'c', fc, f_NLOS2wl_FL1,'y', fc, f_NLOS2wl_FL2, 'm');
    legend('NLOS1 heavy wall d=3', 'NLOS2 heavy wall d=100', 'NLOS1 light wall + FL d=3', 'NLOS1 light wall +FL d=100', 'NLOS2 light wall +FL d=3', 'NLOS2 light wall +FL d=100');
    xlabel('Frequency(GHz)');
    ylabel('Path Loss(PL)');
    title('Scenario A1: NLOS1 vs NLOS2 (light and heavy walls) including FL');
    grid on;
    
    
    subplot(3,1,3)
    plot(fc, f_NLOS2wl_FL1,'y', fc, f_NLOS1wh2, 'b');
    legend('NLOS2 light wall +FL d=3','NLOS2 heavy wall d=100');
    
    xlabel('Frequency(GHz)');
    ylabel('Path Loss(PL)');
    %title('Scenario A1: NLOS1 vs NLOS2 (light and heavy walls) including FL');
    grid on;
    

    
end

