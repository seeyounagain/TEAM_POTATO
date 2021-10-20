<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITLE</title>
</head>
<body>

	<h1 class="display-6 text-center">자료검색</h1>
	<hr>

<div class="row justify-content-center">
	<div class="col-6">
		<div class="row justify-content-center">
			<div class="col-8">
				<input type="text" class="form-control" id="id" name="id" placeholder="검색어를 입력해주세요.">
			</div>
			<div class="col-2 d-grid checkId" style="padding-left: 3px;">
				<button type="button" class="btn btn-primary">검색</button>
			</div>
			<div class="col-2 d-grid checkId" style="padding-left: 3px;">
				<button type="button" class="btn btn-primary">상세검색</button>
			</div>
			<div class="input-group mb-3">
			  <select class="form-select" id="inputGroupSelect02">
			    <option selected>Choose...</option>
			    <option value="1">One</option>
			    <option value="2">Two</option>
			    <option value="3">Three</option>
			  </select>
			  <label class="input-group-text" for="inputGroupSelect02">Options</label>
			</div>
		
			<div class="input-group mb-3">
			  <button class="btn btn-outline-secondary" type="button">Button</button>
			  <select class="form-select" id="inputGroupSelect03" aria-label="Example select with button addon">
			    <option selected>Choose...</option>
			    <option value="1">One</option>
			    <option value="2">Two</option>
			    <option value="3">Three</option>
			  </select>
			</div>
		
			<div class="input-group">
			  <select class="form-select" id="inputGroupSelect04" aria-label="Example select with button addon">
			    <option selected>Choose...</option>
			    <option value="1">One</option>
			    <option value="2">Two</option>
			    <option value="3">Three</option>
			  </select>
			  <button class="btn btn-outline-secondary" type="button">Button</button>
			</div>
		
			<div class="accordion accordion-flush" id="accordionFlushExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="flush-headingOne">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			        상세검색
			      </button>
			    </h2>
			    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			    </div>
			  </div>
			</div>
		</div>
	</div>
</div>

</body>
</html>