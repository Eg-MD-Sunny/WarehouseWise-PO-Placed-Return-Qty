-- Summary Returned

select  w.id WarehouseID,
        w.name Warehouse,
		count(distinct ro.vendorid) TotalVendorReturn,
		count(distinct ro.id) ReturnIDCount,
		Count(*) ReturnQuantity,
		sum(t.ReturnPrice) ReturnPrice

from returnorder ro
join thing t on t.ReturnOrderId=ro.id
join warehouse w on w.id=ro.sourcingwarehouseid

where ro.CreatedOn>=concat(CAST(GETDATE() as date), ' 00:00  +06:00')
and ro.CreatedOn<concat(CAST(GETDATE()+1 as date), ' 00:00  +06:00')
and ro.ReturnOrderStatus = 1
and ro.SourcingWarehouseId in (13,28,30,32)
and w.DistributionNetworkId = 1

group by w.id,
         w.name

order by 1 asc