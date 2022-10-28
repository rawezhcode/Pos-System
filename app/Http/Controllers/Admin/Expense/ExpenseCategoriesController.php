<?php

namespace App\Http\Controllers\Admin\Expense;

use App\DataTables\Expense\ExpenseCategoriesDataTable;
use App\Models\ExpenseCategory;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Gate;

class ExpenseCategoriesController extends Controller
{

    public function index(ExpenseCategoriesDataTable $dataTable) {
        abort_if(Gate::denies('access_expense_categories'), 403);

        return $dataTable->render('Admin.expense.categories.index');
    }

    public function store(Request $request) {
        abort_if(Gate::denies('access_expense_categories'), 403);

        $request->validate([
            'category_name' => 'required|string|max:255|unique:expense_categories,category_name',
            'category_description' => 'nullable|string|max:1000'
        ]);

        ExpenseCategory::create([
            'category_name' => $request->category_name,
            'category_description' => $request->category_description
        ]);

        notyf('Expense Category Created!', 'success');

        return redirect()->route('expense-categories.index');
    }


    public function edit(ExpenseCategory $expenseCategory) {
        abort_if(Gate::denies('access_expense_categories'), 403);

        return view('Admin.expense.categories.edit', compact('expenseCategory'));
    }


    public function update(Request $request, ExpenseCategory $expenseCategory) {
        abort_if(Gate::denies('access_expense_categories'), 403);

        $request->validate([
            'category_name' => 'required|string|max:255|unique:expense_categories,category_name,' . $expenseCategory->id,
            'category_description' => 'nullable|string|max:1000'
        ]);

        $expenseCategory->update([
            'category_name' => $request->category_name,
            'category_description' => $request->category_description
        ]);

        notyf('Expense Category Updated!', 'info');

        return redirect()->route('expense-categories.index');
    }


    public function destroy(ExpenseCategory $expenseCategory) {
        abort_if(Gate::denies('access_expense_categories'), 403);

        if ($expenseCategory->expenses->isNotEmpty()) {
            return back()->withErrors('Can\'t delete beacuse there are expenses associated with this category.');
        }

        $expenseCategory->delete();

        notyf('Expense Category Deleted!', 'warning');

        return redirect()->route('expense-categories.index');
    }
}
