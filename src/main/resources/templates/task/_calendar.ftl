<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Fullcalendar - Wrapkit Admin Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">


        <!-- fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/static/calendar/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/static/calendar/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/static/calendar/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="/static/calendar/ico/apple-touch-icon-57-precomposed.png">
        <link rel="shortcut icon" href="/static/calendar/ico/favicon.png">
        <link rel="shortcut icon" href="/static/calendar/ico/favicon.ico">

        
        <!-- VENDOR -->
        <link rel="stylesheet" href="/static/calendar/styles/jqueryui.min.css">
        <link rel="stylesheet" href="/static/calendar/styles/bootstrap.min.css">
        <!-- END VENDOR -->
        
        <!-- WRAPKIT -->
        <link rel="stylesheet" href="/static/calendar/styles/wrapkit.min.css">
        <link rel="stylesheet" href="/static/calendar/styles/wrapkit-skins-all.min.css">
        <!-- END WRAPKIT -->

        <!-- !IMPORTANT DEPENDENCIES -->
        <link rel="stylesheet" href="/static/calendar/styles/font-awesome.min.css">
        <link rel="stylesheet" href="/static/calendar/styles/switchery.min.css">
        <link rel="stylesheet" href="/static/calendar/styles/toastr.min.css">
        <link rel="stylesheet" href="/static/calendar/styles/prettify.min.css">
        <!-- END !IMPORTANT DEPENDENCIES -->

        <!-- DEPENDENCIES -->
        <link rel="stylesheet" href="/static/calendar/styles/fullcalendar.min.css">
        <!-- END DEPENDENCIES -->



        <!-- JUST DEMO: Remove this css in your project -->
        <link rel="stylesheet" href="/static/calendar/styles/demo.min.css">


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>
		<#include "../stubs/navbar.ftl"/>
		<#include "../stubs/alert.ftl"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
                    <!-- FULLCALENDAR
                    ================================================== -->
                    <div id="panel-calendar" class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <form action="#" id="addEvent">
                                        <div class="form-group">
                                            <div class="input-group input-group-in">
                                                <input class="form-control" id="eventTitle" placeholder="Add event">
                                                <div class="input-group-btn">
                                                    <button type="submit" class="btn btn-default"><i class="fa fa-plus"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </form><!-- /form#addEvent -->

                                    <div id="external-events" class="list-group">
                                        <div id="saved" class="list-group-item external-event bg-silc" data-color="bg-silc">Consectetur adipisicing elit</div>
                                        <div id="saved" class="list-group-item external-event bg-ascon" data-color="bg-ascon">Atque, illum, harum, delectus</div>
                                        <div id="saved" class="list-group-item external-event bg-greentur" data-color="bg-greentur">Animi esse ratione quam</div>
                                        <div id="saved" class="list-group-item external-event bg-nephem" data-color="bg-nephem">Quaerat suscipit itaque</div>
                                        <div id="saved" class="list-group-item external-event bg-belpet" data-color="bg-belpet">Ut ipsa pariatur similique</div>
                                        <div id="saved" class="list-group-item external-event bg-wistam" data-color="bg-wistam">Repudiandae quibusdam</div>
                                        <div id="saved" class="list-group-item external-event bg-osun" data-color="bg-osun">Consectetur adipisicing elit</div>
                                        <div id="saved" class="list-group-item external-event bg-pumcar" data-color="bg-pumcar">Atque, illum, harum, delectus</div>
                                        <div id="saved" class="list-group-item external-event bg-pomeal" data-color="bg-pomeal">Animi esse ratione quam</div>
                                        <div id="saved" class="list-group-item external-event bg-inverse" data-color="bg-inverse">Repudiandae quibusdam</div>
                                    </div><!--list-group-->
                                    <div>
                                        <div class="nice-checkbox">
                                            <input id="drop-remove" type="checkbox" checked="checked">
                                            <label for="drop-remove">Remove after drop</label>
                                        </div>
                                    </div>
                                    <hr class="hidden-md hidden-lg">
                                </div><!-- /.cols -->

                                <div class="col-md-9">
                                    <div class="pull-right">
                                        <button id="calendar-viewtoday" class="btn btn-sm btn-default">Today</button>
                                        <div class="btn-group btn-group-sm">
                                            <button id="calendar-viewmonth" class="btn btn-default active">Month</button>
                                            <button id="calendar-viewweek" class="btn btn-default">Week</button>
                                            <button id="calendar-viewday" class="btn btn-default">Day</button>
                                        </div>
                                    </div><!-- /.btn-toolbar -->
                                    <p id="calendar-viewtitle" class="lead pull-left"></p>
                                    <div class="clearfix"></div>

                                    <div id="calendar"></div>

                                    <br>
                                    <div class="btn-toolbar" role="toolbar">
                                        <div class="btn-group btn-group-sm pull-right">
                                            <button id="calendar-viewnext" class="btn btn-default">Next</button>
                                            <button id="calendar-viewnextYear" class="btn btn-default">Next Year</button>
                                        </div>
                                        <div class="btn-group btn-group-sm">
                                            <button id="calendar-viewprevYear" class="btn btn-default">Prev Year</button>
                                            <button id="calendar-viewprev" class="btn btn-default">Prev</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
		</div>



        <!-- Modal Setups -->
        <!-- Modal -->
        <div class="modal fade" id="templateSetup" tabindex="-1" role="dialog" aria-labelledby="templateSetupLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content"></div>
            </div>
        </div>

		<!-- task model -->
		<div class="modal fade" id="taskModal" tabindex="-1">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Add Task</h4>
					</div>
					<div class="modal-body clearfix">
						<form action="/task" method="post" class="form-horizontal">
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
										<label class="control-label col-xs-3">Name</label>
										<div class="col-xs-9">
											<input class="form-control" type="text" name="name" placeholder="Name" value=""/>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-xs-3">Date</label>
										<div class="col-xs-9">
											<input class="form-control" type="date" name="date" placeholder="Date" value=""/>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-xs-3">Customer</label>
										<div class="col-xs-9">
											<select class="form-control" name="contactId">
												<option value="0"></option>
												<#list contacts as contact>
													<option value="${(contact.id)!}">${(contact.firstName)!} ${(contact.lastName)!}</option>
												</#list>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-xs-3">Priority</label>
										<div class="col-xs-9">
											<select name="priority" class="form-control">
												<option value="0">Low</option>
												<option value="1">Medium</option>
												<option value="2">High</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-xs-3">Status</label>
										<div class="col-xs-9">
											<select name="status" class="form-control">
												<option value="0">Open</option>
												<option value="1">Closed</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-12">Description</label>
										<div class="col-xs-12">
											<textarea name="description" class="form-control" rows="5"></textarea>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label class="col-xs-3">Send Email</label>
										<div class="col-xs-4">
											<label><input type="radio" name="sendEmail" value="1"> &nbsp;&nbsp;&nbsp;True</label>
										</div>
										<div class="col-xs-4">
											<label><input type="radio" name="sendEmail" value="0"> &nbsp;&nbsp;&nbsp;False</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3">Send Text</label>
										<div class="col-xs-4">
											<label><input type="radio" name="sendText" value="1"> &nbsp;&nbsp;&nbsp;True</label>
										</div>
										<div class="col-xs-4">
											<label><input type="radio" name="sendText" value="0"> &nbsp;&nbsp;&nbsp;False</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3">Repeat</label>
										<div class="col-xs-4">
											<label><input type="radio" name="repeate" value="1"> &nbsp;&nbsp;&nbsp;True</label>
										</div>
										<div class="col-xs-4">
											<label><input type="radio" name="repeate" value="0"> &nbsp;&nbsp;&nbsp;False</label>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-xs-3">Repeat Interval</label>
										<div class="col-xs-9">
											<select class="form-control" name="repeatInterval">
												<option value="0">Weekly</option>
												<option value="1">Monthly</option>
												<option value="2">Yearly</option>
											</select>
										</div>
									</div>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="form-group">
										<button class="btn btn-block btn-primary">Save</button>
									</div>
									<#if task??>
										<input type="hidden" name="id" value="${(task.id)!}"/>
										<div class="form-group">
											<a href="#" id="deleteButton" data-delete="/task/${(task.id)!}" class="btn btn-danger btn-block">Delete</a>
										</div>
									</#if>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		[${tasks?join(",")}]

        <!-- VENDOR -->
        <script src="/static/calendar/scripts/jquery.min.js"></script>
        <script src="/static/calendar/scripts/bootstrap.min.js"></script>
        <script src="/static/calendar/scripts/jquery-ui.min.js"></script>
        <!-- END VENDOR -->

        
        <!-- !IMPORTANT DEPENDENCIES -->
        <script src="/static/calendar/scripts/jquery.ui.touch-punch.min.js"></script>
        <script src="/static/calendar/scripts/jquery.cookie.min.js"></script>
        <script src="/static/calendar/scripts/screenfull.min.js"></script>
        <script src="/static/calendar/scripts/jquery.autogrowtextarea.min.js"></script>
        <script src="/static/calendar/scripts/jquery.nicescroll.min.js"></script>
        <script src="/static/calendar/scripts/bootbox.min.js"></script>
        <script src="/static/calendar/scripts/switchery.min.js"></script>
        <script src="/static/calendar/scripts/toastr.min.js"></script>
        <script src="/static/calendar/scripts/components-setup.min.js"></script>
        <!-- END !IMPORTANT DEPENDENCIES -->

        
        <!-- WRAPKIT -->
        <script src="/static/calendar/scripts/wrapkit-utils.min.js"></script>
        <script src="/static/calendar/scripts/wrapkit-layout.min.js"></script>
        <script src="/static/calendar/scripts/wrapkit-header.min.js"></script>
        <script src="/static/calendar/scripts/wrapkit-sidebar.min.js"></script>
        <script src="/static/calendar/scripts/wrapkit-content.min.js"></script>
        <script src="/static/calendar/scripts/wrapkit-footer.min.js"></script>
        <script src="/static/calendar/scripts/wrapkit-panel.min.js"></script>
        <script src="/static/calendar/scripts/wrapkit-setup.min.js"></script>
        <!-- END WRAPKIT -->

        <!-- DEPENDENCIES -->
        <script src="/static/calendar/scripts/moment.min.js"></script>
        <script src="/static/calendar/scripts/fullcalendar.min.js"></script>
        <!-- END DEPENDENCIES -->
        
        <!-- Dummy script -->
        <script type="text/javascript" src="/static/calendar/scripts/demo/fullcalendar-demo.js"></script>

        <!-- Google Analytics: change UA-48454066-1 to be your site's ID. Or remove it if you want -->
        <script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-48454066-1');ga('send','pageview');
        </script>

		<script>
			var events = [${tasks?join(",")}];
			$(document).ready(function() {
				for (var i = 0; i < events.length; i++) {
					$('#calendar').fullCalendar('renderEvent', events[i], true);
				}
			});
		</script>

    </body>
</html>