select * from AlertsSent order by 1 desc

select * from TeamMSFlowsAlertsSent tas where executed = 1

select * from TeamMSFlowsAlertsSent tas where executed = 0


update TeamMSFlowsAlertsSent set executed = -1 from TeamMSFlowsAlertsSent tas where len(tas.alertcontacts) = 0
update TeamMSFlowsAlertsSent set executed = -2 from TeamMSFlowsAlertsSent tas where tas.alertcontacts is null
update TeamMSFlowsAlertsSent set executed = -3 from TeamMSFlowsAlertsSent tas where charindex('@',tas.alertcontacts) = 0

select * from TeamMSFlowsAlertsSent where body like '%CARIVProdSupp-SupIssues-162%'

select * from PSJamaItems where JamaID like '%CARIVProdSupp-SupIssues-162%'	

select * from TeamMSFlowsDebug
	where BegEffDate > '2018-11-04'
	 order by 1 desc

select  top 100 * from PSTracking order by 1 desc

select supportstate, ppi2.name supportstatename, severity, ppi.name severityname, Neededby, * from CARiversideSupportIssues csi
       left join PSJamaPickListItems ppi on ppi.id = csi.severity
       left join PSJamaPickListItems ppi2 on ppi2.picklistid = 737 and ppi2.ID = csi.SupportState
       where itemtype = 140
              --and JamaID in ('CARIVProdSupp-SupIssues-140')
       order by createddate desc
