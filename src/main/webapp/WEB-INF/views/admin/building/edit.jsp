<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/29/2025
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>

<c:url var="buildingAPI" value="/admin/building"/>
<html>
<head>
    <title>Thêm tòa nhà</title>
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
                    <a href="#">Quản lí tòa nhà</a>
                </li>
                <li class="active">Thêm</li>
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
                <form:form action="" method="GET"  modelAttribute="buildingEdit" id="form-edit">
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Tên tòa nhà</h5>
                        </div>
                        <div class="col-xs-9">
                           <form:input class="form-control" path="name"/>
                        </div>

                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Quận</h5>
                        </div>
                        <div class="col-xs-2">
                            <form:select class="form-control" path="district">
                                <form:option value="">--Chọn Quận--</form:option>
<%--                                <form:option value="1">Quận 1</form:option>--%>
<%--                                <form:option value="2">Quận 2</form:option>--%>
<%--                                <form:option value="5">Quận 5</form:option>--%>
                                <form:options items="${districts}"/>
                            </form:select>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Phường</h5>
                        </div>
                        <div class="col-xs-9">
<%--                            <input class="form-control" type="text" name="ward" id="ward">--%>
                            <form:input class="form-control" path="ward"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Đường</h5>
                        </div>
                        <div class="col-xs-9">
<%--                            <input class="form-control" type="text" name="street" id="street">--%>
                            <form:input class="form-control" path="street"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Kết cấu</h5>
                        </div>
                        <div class="col-xs-9">
<%--                            <input class="form-control" type="text" name="structure" id="structure">--%>
                            <form:input class="form-control" path=""/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Số tầng hầm</h5>
                        </div>
                        <div class="col-xs-9">
<%--                            <input class="form-control" type="number" name="numberOfBasement" id="numberOfBasement">--%>
                            <form:input class="form-control" path="numberOfBasement"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Diện tích sàn</h5>
                        </div>
                        <div class="col-xs-9">
<%--                            <input class="form-control" type="number" name="floorArea" id="floorArea">--%>
                            <form:input class="form-control" path="floorArea"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Hướng</h5>
                        </div>
                        <div class="col-xs-9">
<%--                            <input class="form-control" type="text" name="direction" id="direction">--%>
                            <form:input class="form-control" path="direction"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Hạng</h5>
                        </div>
                        <div class="col-xs-9">
<%--                            <input class="form-control" type="number" name="level" id="level">--%>
                            <form:input class="form-control" path="level"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Diện tích thuê</h5>
                        </div>
                        <div class="col-xs-9">
<%--                            <input class="form-control" type="text" name="rentarea" id="rentarea">--%>
                            <form:input class="form-control" path="rentArea"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Giá thuê</h5>
                        </div>
                        <div class="col-xs-9">
<%--                            <input class="form-control" type="number" name="rentprice" id="rentprice">--%>
                            <form:input class="form-control" path="rentPrice"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Mô tả giá</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:input class="form-control" path="rentPriceDescription" />
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Phí dịch vụ</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:input class="form-control" path="serviceFee"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Phí ô tô</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:input class="form-control" path="carFee"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Phí mô tô</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:input class="form-control" path="motoFee"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Phí ngoài giờ</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:input class="form-control" path="overtimeFee"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Tiền điện</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:input class="form-control" path="electricityFee"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Đặt cọc</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:input class="form-control" path="deposit"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Thanh toán</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:input class="form-control" path="payment"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Thời hạn thuê</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:input class="form-control" path="rentTime"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Thời gian trang trí</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:input class="form-control" path="decorationTime"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Tên quản lí</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:input class="form-control" path="managerName"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>SĐT quản lý</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:input class="form-control" path="managerPhone"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Phí môi giới</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:input class="form-control" path="brokerageFee"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Loại tòa nhà</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:checkboxes items="${typeCodes}" path="typeCode"/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2">
                            <h5>Ghi chú</h5>
                        </div>
                        <div class="col-xs-9">
                            <form:input class="form-control" path=""/>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group">
                        <div class="col-xs-2"></div>
                        <div class="col-xs-9">
                            <c:if test="${not empty buildingEdit.id}">
                                <button class="btn btn-primary" id="btnAddOrUpdateBuilding">
                                    Cập nhật tòa nhà
                                </button>
                            </c:if>
                            <c:if test="${empty buildingEdit.id}">
                                <button class="btn btn-primary" id="btnAddOrUpdateBuilding">
                                    Thêm tòa nhà
                                </button>
                            </c:if>
                            <button class="btn btn-primary" id="btnCancel">
                                Hủy thao tác
                            </button>
                        </div>
                    </div>
                    <form:hidden path="id" id="buildingId"/>
                </form:form>
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->


<script>
    $('#btnAddOrUpdateBuilding').click(function(e){
        e.preventDefault();
        var data = {};
        var typeCode = [];
        var formData = $('#form-edit').serializeArray();
        $.each(formData, function(i, v){
            if(v.name != 'typeCode') {
                data["" + v.name + ""] = v.value;
            }
            else{
                typeCode.push(v.value);
            }
        })
        data['typeCode'] = typeCode;
        if(typeCode.length !== 0){
            addOrUpdateBuilding(data);
        }
        else{
            // window.location.href = "/admin/building-edit?typeCode=require";
            $.ajax({
                type: "POST",
                url: "/admin/building-edit?typeCode=require",
                data: JSON.stringify(data),
                success: function (response){
                    console.log("Yêu cầu chọn Loại tòa nhà");
                },
                error: function (response){
                    console.log(response);
                }
            })
        }
    });

    function addOrUpdateBuilding(data){
        $.ajax({
            type: "POST",
            url: "${buildingAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            // dataType: "JSON",
            success: function (respond) {
                window.location.href = "/admin/building-list";
                console.log("Success");
            },
            error: function (respond) {
                console.log("Failed");
                console.log(respond);
            }
        });
    }

    $('#btnCancel').click(function (e){
        e.preventDefault();
        window.location.href = "/admin/building-list";
    })
</script>

</body>
</html>
