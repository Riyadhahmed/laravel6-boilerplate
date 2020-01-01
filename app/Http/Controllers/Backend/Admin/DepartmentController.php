<?php

namespace App\Http\Controllers\Backend\Admin;

use App\Models\Department;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\DataTables;
use DB;
use View;

class DepartmentController extends Controller
{
   /**
    * Display a listing of the resource.
    *
    * @return \Illuminate\Http\Response
    */
   public function index()
   {
      return view('backend.admin.department.index');
   }

   public function allDepartments(Request $request)
   {
      if ($request->ajax()) {
         $can_edit = $can_delete = '';
         if (!auth()->user()->can('department-edit')) {
            $can_edit = "style='display:none;'";
         }
         if (!auth()->user()->can('department-delete')) {
            $can_delete = "style='display:none;'";
         }

         $department = Department::orderby('created_at', 'desc')->get();
         return Datatables::of($department)
           ->addColumn('status', function ($department) {
              return $department->status ? '<span class="label label-success">Active</span>' : '<span class="label label-danger">Inactive</span>';
           })
           ->addColumn('action', function ($department) use ($can_edit, $can_delete) {
              $html = '<div class="btn-group">';
              $html .= '<a data-toggle="tooltip" ' . $can_edit . '  id="' . $department->id . '" class="btn btn-xs btn-info mr-1 edit" title="Edit"><i class="fa fa-edit"></i> </a>';
              $html .= '<a data-toggle="tooltip" ' . $can_delete . ' id="' . $department->id . '" class="btn btn-xs btn-danger delete" title="Delete"><i class="fa fa-trash"></i> </a>';
              $html .= '</div>';
              return $html;
           })
           ->rawColumns(['action', 'status'])
           ->addIndexColumn()
           ->make(true);
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }


   /**
    * Show the form for creating a new resource.
    *
    * @return \Illuminate\Http\Response
    */

   public function create(Request $request)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('department-create');
         if ($haspermision) {
            $view = View::make('backend.admin.department.create')->render();
            return response()->json(['html' => $view]);
         } else {
            abort(403, 'Sorry, you are not authorized to access the page');
         }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }

   /**
    * Store a newly created resource in storage.
    *
    * @param  \Illuminate\Http\Request $request
    * @return \Illuminate\Http\Response
    */
   public function store(Request $request)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('department-create');
         if ($haspermision) {

            $rules = [
              'dept_name' => 'required|unique:departments'
            ];

            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
               return response()->json([
                 'type' => 'error',
                 'errors' => $validator->getMessageBag()->toArray()
               ]);
            } else {

               $department = new Department();
               $department->dept_name = $request->input('dept_name');
               $department->description = $request->input('description');
               $department->uploaded_by = auth()->user()->id;
               $department->save(); //
               return response()->json(['type' => 'success', 'message' => "Successfully Created"]);

            }
         } else {
            abort(403, 'Sorry, you are not authorized to access the page');
         }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }


   /**
    * Display the specified resource.
    *
    * @param  \App\Models\Department $department
    * @return \Illuminate\Http\Response
    */
   public function show(Department $department)
   {
      //
   }

   /**
    * Show the form for editing the specified resource.
    *
    * @param  \App\Models\Department $department
    * @return \Illuminate\Http\Response
    */
   public function edit(Request $request, Department $department)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('department-edit');
         if ($haspermision) {
            $view = View::make('backend.admin.department.edit', compact('department'))->render();
            return response()->json(['html' => $view]);
         } else {
            abort(403, 'Sorry, you are not authorized to access the page');
         }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }

   /**
    * Update the specified resource in storage.
    *
    * @param  \Illuminate\Http\Request $request
    * @param  \App\Models\Department $department
    * @return \Illuminate\Http\Response
    */
   public function update(Request $request, Department $department)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('department-create');
         if ($haspermision) {

            Department::findOrFail($department->id);
            $rules = [
              'dept_name' => 'required|unique:departments,dept_name,' . $department->id
            ];

            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
               return response()->json([
                 'type' => 'error',
                 'errors' => $validator->getMessageBag()->toArray()
               ]);
            } else {
               $department->dept_name = $request->input('dept_name');
               $department->description = $request->input('description');
               $department->uploaded_by = auth()->user()->id;
               $department->status = $request->input('status');
               $department->save(); //
               return response()->json(['type' => 'success', 'message' => "Successfully Updated"]);

            }
         } else {
            abort(403, 'Sorry, you are not authorized to access the page');
         }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }

   /**
    * Remove the specified resource from storage.
    *
    * @param  \App\Models\Department $department
    * @return \Illuminate\Http\Response
    */
   public function destroy(Request $request, Department $department)
   {
      if ($request->ajax()) {
         $haspermision = auth()->user()->can('department-delete');
         if ($haspermision) {
            $department->delete();
            return response()->json(['type' => 'success', 'message' => 'Successfully Deleted']);
         } else {
            abort(403, 'Sorry, you are not authorized to access the page');
         }
      } else {
         return response()->json(['status' => 'false', 'message' => "Access only ajax request"]);
      }
   }
}
