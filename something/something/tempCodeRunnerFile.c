#include <stdio.h>

int main()
{
    int n;
    printf("Enter number of the process: ");
    scanf("%d", &n);
    
    int burst = 0, cmpl_T;
    int AT[n], BT[n], WT[n], TT[n];
    float Avg_WT, Avg_TT, Total = 0;
    
    printf("Enter Arrival time and Burst time of the process\n");
    printf("Arrival_Time\tBurst_Time\n");
    for (int i = 0; i < n; i++)
    {
        scanf("%d%d", &AT[i], &BT[i]);
    }
    for (int i = 0; i < n; i++)
    {
        if (i == 0)
            WT[i] = AT[i];
        else
            WT[i] = burst - AT[i];
        burst += BT[i];
        Total += WT[i];
    }
    Avg_WT = Total / n;
    cmpl_T = 0;
    Total = 0;
    for (int i = 0; i < n; i++)
    {
        cmpl_T += BT[i];
        TT[i] = cmpl_T - AT[i];
        Total += TT[i];
    }
    Avg_TT = Total / n;
    printf("Process Waiting_time TurnAround_time\n");
    for (int i = 0; i < n; i++)
    {
        printf("  %d\t\t%d\t\t%d\n", i + 1, WT[i], TT[i]);
    }
    printf("Average waiting time is : %f\n", Avg_WT);
    printf("Average turn around time is : %f\n", Avg_TT);
    return 0;
}