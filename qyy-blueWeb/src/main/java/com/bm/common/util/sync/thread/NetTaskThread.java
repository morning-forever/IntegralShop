package com.bm.common.util.sync.thread;

import java.util.Date;
import java.util.Stack;

import com.bm.common.util.sync.ITaskHandler;
import com.bm.common.util.sync.SyncTask;

/**
 * 
 * 进行网络异步执行的线程
 * 
 * 
 * @author mike
 *
 */
public class NetTaskThread implements Runnable {

	private static Stack<SyncTask> taskStack = new Stack<SyncTask>();

	public static boolean isRun = true;

	private static NetTaskThread instance;

	public synchronized static NetTaskThread newInstance() {
		if (instance == null)
			synchronized (NetTaskThread.class) {
				if (instance == null)
					instance = new NetTaskThread();
			}
		return instance;
	}

	private NetTaskThread() {
		Thread t = new Thread(this);
		t.start();
		System.out.println("-------The sync Thread instance success,the task Thread start success!");
	}

	public static void addTask(SyncTask task) {
		taskStack.add(task);
	}

	@Override
	public void run() {
		while (isRun) {
			SyncTask task = null;
			try {
				if (taskStack.size() > 0) {
					task = taskStack.get(0);
					doTask(task);
				}
			} catch (Exception e) {
				System.out.println(new Date() + " : -------AT:sync - 失败任务     taskId:" + task.getTaskId() + "\t params:" + task.getParams());
				e.printStackTrace();
			} finally {

			}
		}
	}

	private static void doTask(SyncTask task) throws Exception {
		try {
			System.out.println(new Date() + " : -------AT:sync - 执行任务      taskId:" + task.getTaskId() + "\t params:" + task.getParams());
			ITaskHandler taskHandler = task.getTaskHandler();
			taskHandler.execute(task.getParams(), task.getTaskId());
			taskStack.remove(task);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(new Date() + " : -------AT:sync - taskId:" + task.getTaskId() + "\t" + e.getMessage() + "-------同步线程执行出现异常！！！");
		}
	}
}
