import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'are_you_sure_subtask_model.dart';
export 'are_you_sure_subtask_model.dart';
import 'package:groupify_final/sql_database_connection.dart';

class AreYouSureSubtaskWidget extends StatefulWidget {
  final String? projectName;
  final String? pOwnerId;
  final String? pDescription;
  final String? tName;
  final String? stName;
  const AreYouSureSubtaskWidget({super.key, this.projectName, this.pOwnerId, this.pDescription, this.tName, this.stName});

  @override
  State<AreYouSureSubtaskWidget> createState() =>
      _AreYouSureSubtaskWidgetState();
}

class _AreYouSureSubtaskWidgetState extends State<AreYouSureSubtaskWidget> {
  late AreYouSureSubtaskModel _model;

  late SQLDatabaseHelper _sqldatabaseHelper;
  Future<void> _connectToDatabase() async {
    await _sqldatabaseHelper.connectToDatabase();
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AreYouSureSubtaskModel());

    _sqldatabaseHelper = SQLDatabaseHelper();
    _connectToDatabase();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

Future<void> _deleteSubTask(String? projectName, String? pOwnerID, String? tName, String? stName) async {
    await _sqldatabaseHelper.connection.query( 
      'DELETE FROM Subtasks WHERE projectName = ? and ownerID = ? and taskName = ? and subTaskName = ?;', [projectName, pOwnerID, tName, stName]);

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 300.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: 368.0,
                    height: 77.0,
                    decoration: const BoxDecoration(),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'itz2851z' /* Are you sure you wish to delet... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 20.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      await _deleteSubTask(widget.projectName, widget.pOwnerId, widget.tName, widget.stName);
                      await _sqldatabaseHelper.closeConnection();
                      context.pushNamed('ProjectPage', queryParameters: {
                                  'projectOwnerID': widget.pOwnerId,
                                  'projectName': widget.projectName,
                                  'projectDescription': widget.pDescription,});
                    },
                    text: FFLocalizations.of(context).getText(
                      'jaw66i4j' /* Yes */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xB2F90101),
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      await _sqldatabaseHelper.closeConnection();
                      context.safePop();
                    },
                    text: FFLocalizations.of(context).getText(
                      'zriq2ufz' /* No */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
