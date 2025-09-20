<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/29/2025
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListUrl" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/admin/building"/>
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Quản lí tòa nhà</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    Danh sách tòa nhà
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box ui-sortable-handle">
                        <div class="widget-header">
                            <h5 class="widget-title">Tìm kiếm</h5>

                            <div class="widget-toolbar">

                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <form:form id="listForm" modelAttribute="modelSearch" action="${buildingListUrl}" method="GET" >
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="col-xs-6">
                                                <label for="">Tên tòa nhà</label>
<%--                                                <input type="text" name="name" class="form-control" value="${modelSearch.name}">--%>
                                                <form:input path="name" class="form-control"/>
                                            </div>
                                            <div class="col-xs-6">
                                                <label for="">Diện tích sàn</label>
<%--                                                <input type="number" name="floorArea" class="form-control" value="${modelSearch.floorArea}">--%>
                                                <form:input path="floorArea" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="col-xs-2">
                                                <label for="">Quận</label>
                                                <form:select path="district" id="" class="form-control">
                                                    <form:option value="">--Chọn Quận--</form:option>
<%--                                                <c:forEach var="item" items="${districts}">--%>
<%--                                                    <form:option value="${item.key}">${item.value}</form:option>--%>
<%--                                                </c:forEach>--%>
                                                    <form:options items="${districts}"/>
                                                </form:select>
                                            </div>
                                            <div class="col-xs-5">
                                                <label for="">Phường</label>
<%--                                                <input type="text" name="ward" class="form-control" value="${modelSearch.ward}">--%>
                                                <form:input path="ward" class="form-control"/>
                                            </div>
                                            <div class="col-xs-5">
                                                <label for="">Đường</label>
<%--                                                <input type="text" name="street" class="form-control" value="${modelSearch.street}">--%>
                                                <form:input path="street" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="col-xs-4">
                                                <label for="">Số tầng hầm</label>
<%--                                                <input type="number" name="numberOfBasement" class="form-control" value="${modelSearch.numberOfBasement}">--%>
                                                <form:input path="numberOfBasement" class="form-control"/>
                                            </div>
                                            <div class="col-xs-4">
                                                <label for="">Hướng</label>
<%--                                                <input type="text" name="direction" class="form-control" value="">--%>
                                                <form:input path="direction" class="form-control"/>
                                            </div>
                                            <div class="col-xs-4">
                                                <label for="">Hạng</label>
<%--                                                <input type="number" name="level" class="form-control" value="">--%>
                                                <form:input path="level" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="col-xs-3">
                                                <label for="">Diện tích từ</label>
<%--                                                <input type="number" name="areaFrom" class="form-control" value="">--%>
                                                <form:input path="areaFrom" class="form-control"/>
                                            </div>
                                            <div class="col-xs-3">
                                                <label for="">Diện tích đến</label>
<%--                                                <input type="number" name="areaTo" class="form-control" value="">--%>
                                                <form:input path="areaTo" class="form-control"/>
                                            </div>
                                            <div class="col-xs-3">
                                                <label for="">Giá thuê từ</label>
<%--                                                <input type="number" name="rentPriceFrom" class="form-control" value="">--%>
                                                <form:input path="rentPriceFrom" class="form-control"/>
                                            </div>
                                            <div class="col-xs-3">
                                                <label for="">Giá thuê đến</label>
<%--                                                <input type="number" name="rentPriceTo" class="form-control" value="">--%>
                                                <form:input path="rentPriceTo" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="col-xs-5">
                                                <label for="">Tên quản lí</label>
<%--                                                <input type="text" name="managerName" class="form-control" value="">--%>
                                                <form:input path="managerName" class="form-control"/>
                                            </div>
                                            <div class="col-xs-5">
                                                <label for="">SĐT Quản lý</label>
<%--                                                <input type="number" name="managerPhone" class="form-control" value="">--%>
                                                <form:input path="managerPhone" class="form-control"/>
                                            </div>
                                            <div class="col-xs-2">
                                                <label for="">Nhân Viên</label>
                                                <form:select path="staffId" id="" class="form-control">
                                                    <form:option value="">--Chọn Nhân viên--</form:option>
<%--                                                <c:forEach var="item" items="${listStaffs}">--%>
<%--                                                     <form:option value="${item.key}">${item.value}</form:option>--%>
<%--                                                </c:forEach>--%>
                                                    <form:options items="${listStaffs}"/>
                                                </form:select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="col-xs-6">
<%--                                                <label for="" class="checkbox-inline">--%>
<%--                                                    <input type="checkbox" name="typeCode" value="noi-that">Nội thất--%>
<%--                                                </label>--%>
<%--                                                <label for="" class="checkbox-inline">--%>
<%--                                                    <input type="checkbox" name="typeCode" value="nguyen-can">Nguyên căn--%>
<%--                                                </label>--%>
<%--                                                <label for="" class="checkbox-inline">--%>
<%--                                                    <input type="checkbox" name="typeCode" value="tang-tret">Tầng trệt--%>
<%--                                                </label>--%>
                                                <form:checkboxes items="${typeCodes}" path="typeCode"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="col-xs-6">
                                                <button class="btn btn-success" id="btnSearchBuilding">
                                                    <i class="ace-icon glyphicon glyphicon-search"></i>Tìm kiếm
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                    <a href="/admin/building-edit">
                        <button class="btn btn-success" title="Thêm tòa nhà">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-building-fill-add" viewBox="0 0  16">
                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                            </svg>
                        </button>
                    </a>

                    <button class="btn btn-success" title="Xóa tòa nhà" id="btnDeleteBuildings">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-building-fill-dash" viewBox="0 0 16 16">
                            <path
                                    d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                            <path
                                    d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                        </svg>
                    </button>
                </div>
            </div><!-- /.row -->
            <br>
            <div class="row">
                <div class="col-xs-12">
                    <table id="tableList" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>Tên tòa nhà</th>
                            <th>Địa chỉ</th>
                            <th>Số tầng hầm</th>
                            <th>Tên quản lí</th>
                            <th>Số điện thoại quản lí</th>
                            <th>D.Tích sàn</th>
                            <th>D.Tích trống</th>
                            <th>D.Tích thuê</th>
                            <th>Giá thuê</th>
                            <th>Phí môi giới</th>
                            <th>Phí dịch vụ</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="item" items="${buildingList}">
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td>${item.name}</td>
                                <td>${item.address}</td>
                                <td>${item.numberOfBasement}</td>
                                <td>${item.managerName}</td>
                                <td>${item.managerPhone}</td>
                                <td>${item.floorArea}</td>
                                <td>${item.emptyArea}</td>
                                <td>${item.rentArea}</td>
                                <td>${item.rentPrice}</td>
                                <td>${item.brokerageFee}</td>
                                <td>${item.serviceFee}</td>

                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <button class="btn btn-xs btn-success" title="Giao tòa nhà"
                                                onclick="assignmentBuilding(${item.id})">
                                            <i class="ace-icon fa fa-users"></i>
                                        </button>

                                        <a href="/admin/building-edit-${item.id}" class="btn btn-xs btn-info" title="Sửa tòa nhà">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>

                                        <button class="btn btn-xs btn-danger" onclick="deleteBuilding(${item.id})" title="Xóa tòa nhà">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>
                                    </div>

                                </td>
                            </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div><!-- /.span -->
            </div>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->


<div class="modal fade" id="assignmentBuildingModal" role="dialog"
     style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <table id="staffList" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="center">Chọn</th>
                        <th class="center">Tên nhân viên</th>
                    </tr>
                    </thead>
                    <tbody>
<%--                        <tr class="center">--%>
<%--                            <td><input type="checkbox" id="checkbox_1" value="1" checked></td>--%>
<%--                            <td>Nguyễn Mạnh Kha</td>--%>
<%--                        </tr>--%>

                    </tbody>
                </table>
                <input type="hidden" name="buildingId" id="buildingId" value="">
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" id="btnAssignmentBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>

            </div>

        </div>
    </div>
</div>

<script>
    function assignmentBuilding(buildingId){
        $("#assignmentBuildingModal").modal();
        loadStaff(buildingId);
        $("#buildingId").val(buildingId);
    }

    function loadStaff(buildingId){
        $.ajax({
            type: "GET",
            url: "${buildingAPI}/" + buildingId + "/staffs",
            // data: JSON.stringify(buildingId),
            // contentType: "application/json",
            dataType: "JSON",
            success: function (response) {
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<tr class="center">';
                    row += '<td><input type="checkbox" id="checkbox_' + item.staffId + '"' + ' value="' + item.staffId + '" ' + item.checked + '/></td>';
                    row += '<td>' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
                console.info("Success");
            },
            error: function (response) {
                console.log("Failed");
                window.location.href = "/admin/building-list?message=error";
                console.log(response);
            }
        })
    }

    $('#btnAssignmentBuilding').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList')
                    .find('tbody input[type = checkbox]:checked')
                    .map(function(){
                         return $(this).val();
                    })
                    .get();
        data['staffs'] = staffs;

        if(data['staffs'] != null) {
            $.ajax({
                type: "POST",
                url: "${buildingAPI}" + "/assignment",
                data: JSON.stringify(data),
                contentType: "application/json",
                success: function (response) {
                    console.log("OK");
                },
                error: function (response) {
                    console.info("Giao không thành công");
                    window.location.href = "/admin/building-list?message=error";
                    console.log(response);
                }
            });
        }
    })

    $("#btnSearchBuilding").click(function (e){
        e.preventDefault();
        $("#listForm").submit();
    })

    function deleteBuilding(id){
        var buildingId = [id];
        deleteBuildings(buildingId);
    }

    $('#btnDeleteBuildings').click(function(e){
        e.preventDefault();
        var buildingIds = $('#tableList')
                    .find('tbody input[type = checkbox]:checked')
                    .map(function(){
                         return $(this).val();
                    })
                    .get();
        deleteBuildings(buildingIds);
    })

    function deleteBuildings(data){
        $.ajax({
            type: "DELETE",
            url: "${buildingAPI}/" + data,
            success: function (response) {
                location.reload();
                console.log("Success");
            },
            error: function (response) {
                console.log("Failed");
                console.log(response);
            }
        })
    }
</script>

</body>
</html>
